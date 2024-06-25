import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NewtworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NewtworkInfo{
  InternetConnectionChecker _dataConnectionChecker;
  NetworkInfoImpl(this._dataConnectionChecker);
  @override
  Future<bool> get isConnected =>  _dataConnectionChecker.hasConnection; 
}