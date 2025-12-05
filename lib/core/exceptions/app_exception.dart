abstract class AppException implements Exception {
  String message;
  int? statusCode;
  AppException({required this.message,this.statusCode});
}

class NetworkException extends AppException{
  NetworkException({required super.message,super.statusCode});
}

class ServerException extends AppException{
  ServerException({required super.message,super.statusCode});
}

class UnExpectedException extends AppException{
  UnExpectedException({required super.message,super.statusCode});
}
