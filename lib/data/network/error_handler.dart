import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
  UNAUthORIZED,
  UNKNOWN,
}

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its error response
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      // TODO: Handle this case.
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      // TODO: Handle this case.
      case DioExceptionType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();

      // TODO: Handle this case.
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();

          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();

          case ResponseCode.UNAUthORIZED:
            return DataSource.UNAUthORIZED.getFailure();

          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();

          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();

          default:
            return DataSource.DEFAULT.getFailure();
        }
      // TODO: Handle this case.
      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      // TODO: Handle this case.
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.DEFAULT.getFailure();
      // TODO: Handle this case.
      case DioExceptionType.connectionError:
        return DataSource.DEFAULT.getFailure();
      // TODO: Handle this case.
    }
  }
}

class ResponseCode {
  //API status codes
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success with no data
  static const int BAD_REQUEST = 400; //failure with bad request
  static const int FORBIDDEN = 403; //failure with forbidden
  static const int UNAUthORIZED = 401; //failure with user is unauthorized
  static const int NOT_FOUND = 404; //failure, api not found
  static const int INTERNAL_SERVER_ERROR =
      500; //failure with internal server error

  //local status codes
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

extension DataSourceResponseExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      // TODO: Handle this case.
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      // TODO: Handle this case.
      case DataSource.BAD_REQUEST: //
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      // TODO: Handle this case.
      case DataSource.FORBIDDEN: //
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      // TODO: Handle this case.
      case DataSource.NOT_FOUND: //
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      // TODO: Handle this case.
      case DataSource.INTERNAL_SERVER_ERROR:

        ///
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      // TODO: Handle this case.
      case DataSource.CONNECT_TIMEOUT: //
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      // TODO: Handle this case.
      case DataSource.CANCEL: //
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      // TODO: Handle this case.
      case DataSource.RECEIVE_TIMEOUT: //
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      // TODO: Handle this case.
      case DataSource.SEND_TIMEOUT: //
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      // TODO: Handle this case.
      case DataSource.CACHE_ERROR: //
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      // TODO: Handle this case.
      case DataSource.NO_INTERNET_CONNECTION: //
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      // TODO: Handle this case.
      case DataSource.UNAUthORIZED: //
        return Failure(ResponseCode.UNAUthORIZED, ResponseMessage.UNAUthORIZED);
      // TODO: Handle this case.
      case DataSource.DEFAULT: //
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
        break;
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseMessage {
  //API status codes
  static const String SUCCESS = "succes"; //success with data
  static const String NO_CONTENT =
      "succes with no content"; //success with no data
  static const String BAD_REQUEST =
      "Bad request, try again later"; //failure with bad request
  static const String FORBIDDEN =
      "forbidden request, try again later"; //failure with forbidden
  static const String UNAUthORIZED =
      "user is unauthorized,try again later"; //failure with user is unauthorized
  static const String NOT_FOUND =
      "url not found, try again later"; //failure, api not found
  static const String INTERNAL_SERVER_ERROR =
      "some thing went wrong, try again later"; //failure with internal server error

  //local status codes
  static const String DEFAULT = "some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "Request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "time out error, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "please check your internet connection";
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
