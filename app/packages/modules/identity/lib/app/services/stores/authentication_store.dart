// ignore_for_file: use_build_context_synchronously

import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/utils/local_storage/ilocal_storage_util.dart';
import 'package:dependencies/dependencies.dart';
import 'package:identity/app/domain/data/isign_in_data.dart';
import 'package:identity/app/domain/data/isign_up_data.dart';
import 'package:identity/app/main/factories/login_with_authentication_code_factory.dart';
import 'package:identity/app/main/factories/send_authentication_code_factory.dart';
import 'package:identity/app/main/factories/sign_up_factory.dart';
import 'package:identity/app/services/protocols/iauthentication_store.dart';

class AuthenticationStore implements IAuthenticationStore {
  final ILocalStorageUtil localStorageUtil = autoInjector.get();

  @override
  late String email;

  @override
  Future<void> sendAuthenticationCode(String email) async {
    this.email = email;
    await SendAuthenticationCodeFactory()(email);
  }

  @override
  Future<bool> signInWithAuthenticationCode(String code) async {
    final response = await LoginWithAuthenticationCodeFactory()(
      SignInRequest(authCode: code, email: email),
    );

    if (response.accessToken.isNotEmpty) {
      await localStorageUtil.setValue(
        ValuesTypes.string,
        'accessToken',
        response.accessToken,
      );
      await localStorageUtil.setValue(
        ValuesTypes.string,
        'refreshToken',
        response.refreshToken,
      );
      return true;
    }

    return false;
  }

  @override
  Future<void> registerWithEmail(
    String email,
    DateTime birthDate,
    String userName,
  ) async {
    this.email = email;
    await SignUpFactory()(
      SignUpRequest(email: email, birthDate: birthDate, userName: userName),
    );
    await SendAuthenticationCodeFactory()(email);
  }

  @override
  Future<void> signOut() async {
    await localStorageUtil.clear();

    if (navigatorKey.currentContext!.mounted) {
      navigatorKey.currentContext!.go('/auth');
    }
  }
}
