import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:clean_architecture_with_mvvm/data/request/request.dart';
import 'package:clean_architecture_with_mvvm/domain/model/model.dart';
import 'package:clean_architecture_with_mvvm/domain/repository/repository.dart';
import 'package:clean_architecture_with_mvvm/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase implements BaseUsecase<LoginUsecaseInput,Authentication>{
  Repository repository;
  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUsecaseInput input)async {
    // TODO: implement execute
    await repository.login(LoginRequest(email: input.email, password: input.password, imei: 'imei', deviceType: 'deviceType'));
  }


}




class LoginUsecaseInput{
String email;
String password;

LoginUsecaseInput(this.email, this.password);
}