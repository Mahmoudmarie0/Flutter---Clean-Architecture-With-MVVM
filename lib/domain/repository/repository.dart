import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:clean_architecture_with_mvvm/data/request/request.dart';
import 'package:clean_architecture_with_mvvm/domain/model/model.dart';
import 'package:dartz/dartz.dart';

//we create this to either responses is success or failure
abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
