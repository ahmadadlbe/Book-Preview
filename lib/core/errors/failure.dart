import 'package:dio/dio.dart';

abstract class Failure {}

class ServerFailure extends Failure {
  ServerFailure({required this.erorrMessage});
  String erorrMessage;

  factory ServerFailure.erorrDioReqwist(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        {
          return ServerFailure(
              erorrMessage:
                  "Connection Timeout  With Api Server , Pleas Try Agin");
        }
      case DioExceptionType.sendTimeout:
        {
          return ServerFailure(
              erorrMessage: "Send  Timeout  With Api Server , Pleas Try Agin");
        }
      case DioExceptionType.receiveTimeout:
        {
          return ServerFailure(
              erorrMessage: "Receive Timeout With Api Server , Pleas Try Agin");
        }
      case DioExceptionType.badCertificate:
        {
          return ServerFailure(
              erorrMessage: "Bad Certificate , Pleas Try Agin");
        }
      case DioExceptionType.badResponse:
        {
          return ServerFailure.dioBadRespon(
              dioException.response!.statusCode!, dioException.response!.data);
        }
      case DioExceptionType.cancel:
        {
          return ServerFailure(erorrMessage: "Request To Api Server Canceled");
        }
      case DioExceptionType.connectionError:
        {
          return ServerFailure(
              erorrMessage: " No Internet Connection  , Pleas Try Agin");
        }
      case DioExceptionType.unknown:
        {
          return ServerFailure(
              erorrMessage: "Unexpected Error , Pleas Try Agin");
        }
    }
  }
  factory ServerFailure.dioBadRespon(int statuscode, dynamic respon) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(erorrMessage: respon['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure(
          erorrMessage: "Your Request Not Found , Please Try Later");
    } else if (statuscode == 500 || statuscode == 501 || statuscode == 429) {
      return ServerFailure(
          erorrMessage: "Internal Server Error , Please Try Later");
    } else {
      return ServerFailure(
          erorrMessage: "Oops Ther Was An Error , Pleas Try Again");
    }
  }
}
