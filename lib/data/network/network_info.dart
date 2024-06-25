abstract class NewtworkInfo{
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NewtworkInfo{
  NetworkInfoImpl();
  @override
  Future<bool> get isConnected => throw UnimplementedError();
}