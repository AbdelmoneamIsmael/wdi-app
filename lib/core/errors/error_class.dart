import 'package:dio/dio.dart';
import 'package:wdi/core/model/general_reponse_model/general_response_model.dart';

abstract class Failure {
  Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException error) {
    if (error.response?.data != null) {
      final response = GeneralResponseModel.fromJson(
        error.response?.data,
        (j) {},
      );
      return ServerFailure(response.message ?? '');
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(error.response!);
      case DioExceptionType.cancel:
        return ServerFailure('Cancel with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure(
          'Connection Error From the server ,Try Again Later',
        );
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error with server, please try again!');
    }
  }
  factory ServerFailure.fromResponse(Response response) {
    if (response.statusCode == 404) {
      return ServerFailure('Not Found');
    } else if (response.statusCode == 500) {
      return ServerFailure('Internal Server Error');
    } else if (response.statusCode == 400) {
      return ServerFailure('${response.data}');
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      return ServerFailure(response.statusMessage!);
    } else {
      return ServerFailure('Unexpected Error, please try again!');
    }
  }
}

class CashingFailure extends Failure {
  CashingFailure(super.message);
}
