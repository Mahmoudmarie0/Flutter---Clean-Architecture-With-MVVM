import 'package:clean_architecture_with_mvvm/data/data_source/remote_data_source.dart';
import 'package:clean_architecture_with_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:clean_architecture_with_mvvm/data/network/network_info.dart';
import 'package:clean_architecture_with_mvvm/data/request/request.dart';
import 'package:clean_architecture_with_mvvm/domain/model.dart';
import 'package:clean_architecture_with_mvvm/domain/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_with_mvvm/data/mapper/mapper.dart';

class RepositoryImpl extends Repository {
   RemoteDataSource remoteDataSource;
   NewtworkInfo networkInfo;

  RepositoryImpl( this.remoteDataSource,  this.networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest)async {
    if (await networkInfo.isConnected) {
      // TODO: implement login
      //its safe to call api
      final response = await remoteDataSource.login(loginRequest);
      if(response.baseResponseStatus == 0) {
        //return data(success)
        //return right
        return Right(response.toDomain());


      }else {
        return Left(Failure(409, response.message??"we have biz error logic from Api Side"));
     //   return biz logic error

      }
    }else {
      //return connection error
      return Left(Failure(501, "No internet connection"));
    }
    // TODO: implement login
    throw UnimplementedError();
  }
  // TODO: implement
 }