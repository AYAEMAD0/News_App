import 'package:dio/dio.dart';
import '../../core/exceptions/app_exception.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    AppException appException;

    final responseData = err.response?.data;
    String message = "Something went wrong";
    if (responseData is Map) {
      message =
          (responseData['errors']?['msg'] as String?) ??
              (responseData['message'] as String?) ??
              message;

      if (err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.connectionError) {
        appException = NetworkException(message: "No Internet Connection");
      } else if (err.response?.statusCode != null) {
        appException = ServerException(
          message: message,
          statusCode: err.response?.statusCode,
        );
      } else {
        appException = UnExpectedException(message: message);
      }

      handler.next(
        DioException(requestOptions: err.requestOptions, error: appException),
      );
    }
  }
}
