import 'package:core/app/utils/use_case.dart';
import 'package:identity/app/domain/data/isend_authentication_code_data.dart';

class SendAuthenticationCodeUseCase extends UseCase<void, String> {
  SendAuthenticationCodeUseCase({
    required this.sendAuthenticationCodeData,
  });

  final ISendAuthenticationCodeData sendAuthenticationCodeData;

  @override
  Future<void> call(String params) async {
    return sendAuthenticationCodeData.send(
      params,
    );
  }
}
