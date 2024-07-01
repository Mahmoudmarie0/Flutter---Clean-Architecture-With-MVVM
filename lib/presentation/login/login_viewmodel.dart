import 'dart:async';

import 'package:clean_architecture_with_mvvm/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture_with_mvvm/presentation/common/freezed_data_classes.dart';

class LoginViewmodel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
  var loginObject = LoginObject("", "");
  LoginUsecase?loginUsecase;
  LoginViewmodel(this.loginUsecase);
  //input from user
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    // TODO: implement dispose
  }

  @override
  void start() {

    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  login() async{
    // TODO: implement login
    ( await loginUsecase.execute(LoginUsecaseInput(loginObject.userName, loginObject.password))).fold(
            (failure) => {
              //left-->failure
              print("failure ${failure.message}"),



            }, (data) =>{
              //right-->success
               print(data.customer?.name),
    });
  }
  @override
  setPassword(String password) {
    // TODO: implement setPassword
    inputPassword.add(password);
    loginObject=loginObject.copyWith(password: password);//data class operation same as kotlin
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    inputUserName.add(userName);
    loginObject=loginObject.copyWith(userName: userName);
  }
//output
  @override
  // TODO: implement outputIsAllInputsValid
  Stream<bool> get outputIsAllInputsValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserValid
  Stream<bool> get outputIsUserValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));


  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }



}


mixin  LoginViewModelInputs{
  //three functions for actions
  setUserName(String userName);
  setPassword(String password);
  login();
  //tow sink for stream
 Sink get inputUserName;
 Sink get inputPassword;
}

mixin LoginViewModelOutputs{
  //tow stream because we have two sink
  Stream<bool> get outputIsUserValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}