import 'dart:async';

import 'package:clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';

class LoginViewmodel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{

  StreamController _userNameStreamController = StreamController<String>.broadcast();
  StreamController _passwordStreamController = StreamController<String>.broadcast();
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
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  @override
  setPassword(String password) {
    // TODO: implement setPassword
    throw UnimplementedError();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    throw UnimplementedError();
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