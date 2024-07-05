import 'package:clean_architecture_with_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_with_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_with_mvvm/data/network/error_handler.dart';
import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:clean_architecture_with_mvvm/data/network/network_info.dart';
import 'package:clean_architecture_with_mvvm/data/request/request.dart';
import 'package:clean_architecture_with_mvvm/domain/model/model.dart';
import 'package:clean_architecture_with_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;
  NewtworkInfo networkInfo;

  RepositoryImpl(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(loginRequest);
        if (response.baseResponseStatus == ApiInternalStatus.SUCCESS) {
          //return data(success)
          //return right
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              response.baseResponseStatus ?? ApiInternalStatus.FAILURE,
              response.message ?? "we have biz error logic from Api Side"));
          //   return biz logic error
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
      // TODO: implement login
      //its safe to call api
    } else {
      //return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
    // TODO: implement login
    throw UnimplementedError();
  }
  // TODO: implement
}
