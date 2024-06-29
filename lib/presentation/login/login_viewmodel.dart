import 'package:clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';

class LoginViewmodel extends BaseViewModel with LoginViewModelInputs,LoginViewModelOutputs{
  @override
  //input from user
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  // TODO: implement inputPassword
  Sink get inputPassword => throw UnimplementedError();

  @override
  // TODO: implement inputUserName
  Sink get inputUserName => throw UnimplementedError();

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
  Stream<bool> get outputIsPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement outputIsUserValid
  Stream<bool> get outputIsUserValid => throw UnimplementedError();


}


abstract class LoginViewModelInputs{
  //three functions for actions
  setUserName(String userName);
  setPassword(String password);
  login();
  //tow sink for stream
 Sink get inputUserName;
 Sink get inputPassword;
}

abstract class LoginViewModelOutputs{
  //tow stream because we have two sink
  Stream<bool> get outputIsUserValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}