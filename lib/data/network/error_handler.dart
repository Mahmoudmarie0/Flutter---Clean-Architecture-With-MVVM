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
  static const int UNKNOWN = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}


class ResponseMessage{
  //API status codes
  static const String SUCCESS = "succes"; //success with data
  static const String NO_CONTENT = "succes with no content"; //success with no data
  static const String BAD_REQUEST = "Bad request, try again later"; //failure with bad request
  static const String FORBIDDEN = "forbidden request, try again later"; //failure with forbidden
  static const String UNAUthORIZED = "user is unauthorized,try again later"; //failure with user is unauthorized
  static const String NOT_FOUND = "url not found, try again later"; //failure, api not found
  static const String INTERNAL_SERVER_ERROR = "some thing went wrong, try again later"; //failure with internal server error

  //local status codes
  static const String UNKNOWN = "some thing went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "Request was cancelled, try again later";
  static const String RECEIVE_TIMEOUT = "time out error, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION = "please check your internet connection";
}

