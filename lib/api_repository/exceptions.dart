class AppException implements Exception {
  AppException({
    this.message = "Something went wrong",
    this.response,
    this.statusCode,
  });
  final String? message;
  final dynamic response;
  final int? statusCode;
}

class ServerException extends AppException {
  ServerException({
    String message = "Something went wrong",
  }) : super(message: message);
}

class ClientException extends AppException {
  ClientException({String? message, dynamic response})
      : super(message: message, response: response);
}

class HttpException extends AppException {
  HttpException({String? message, int? statusCode})
      : super(message: message, statusCode: statusCode);
}
