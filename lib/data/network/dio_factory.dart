import 'package:clean_architecture_with_mvvm/app/app_prefs.dart';
import 'package:clean_architecture_with_mvvm/app/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String Authorization = "authorization";
const String DEFAULT_LANGUAGE = "language";
class DioFactory{
  AppPrefrences appPrefrences;
  DioFactory(this.appPrefrences, );
  Future<Dio> getDio()async{
    Dio dio = Dio();
    int _timeOut=60*1000; //1 min
    String language=await appPrefrences.getAPPLanguage();
   Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      Authorization: Constant.token,
      DEFAULT_LANGUAGE: language
    };
    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      //if server not response
      connectTimeout:_timeOut as Duration,
      receiveTimeout: _timeOut as Duration,
      headers: headers,
    );
      if(kReleaseMode){
        print("release mode no logs");
      }
      else{
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,

        ));
      }


    return dio;
  }


}