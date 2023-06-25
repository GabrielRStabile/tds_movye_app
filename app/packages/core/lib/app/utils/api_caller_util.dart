import 'package:core/app/micro_core_utils.dart';
import 'package:core/app/utils/local_storage/ilocal_storage_util.dart';
import 'package:dependencies/dependencies.dart';

class ApiCallerUtil {
  ApiCallerUtil() {
    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await _storage.getValue<String?>(
            ValuesTypes.string,
            'accessToken',
          );

          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onError: (DioException error, handler) async {
          if (error.response?.statusCode == 401) {
            if ((await _storage.getValue<String>(
              ValuesTypes.string,
              'refreshToken',
            ))
                .isNotEmpty) {
              if (await refreshToken()) {
                return handler.resolve(await _retry(error.requestOptions));
              }
            }
          }
          return handler.next(error);
        },
      ),
    );
  }

  final Dio api = Dio(
    BaseOptions(baseUrl: '${dotenv.env['MOVYE-API-URL']}'),
  );

  final _storage = autoInjector.get<ILocalStorageUtil>();

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> refreshToken() async {
    final refreshToken =
        await _storage.getValue<String>(ValuesTypes.string, 'refreshToken');

    final response = await api.post<String>(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );

    if (response.statusCode == 201) {
      await _storage.setValue(ValuesTypes.string, 'accessToken', response.data);
      return true;
    } else {
      await _storage.remove(
        'refreshToken',
      );
      return false;
    }
  }
}
