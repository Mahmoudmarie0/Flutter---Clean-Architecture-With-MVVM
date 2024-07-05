import 'dart:async';

import 'package:clean_architecture_with_mvvm/domain/usecase/login_usecase.dart';
import 'package:clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture_with_mvvm/presentation/common/freezed_data_classes.dart';

class LoginViewmodel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputsValidStreamController =
      StreamController<void>.broadcast();
  var loginObject = LoginObject("", "");
  LoginUsecase loginUsecase;
  LoginViewmodel(this.loginUsecase);
  //input from user
  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputsValidStreamController.close();
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
  // TODO: implement inputIsAllInputsValid
  Sink get inputIsAllInputsValid => _isAllInputsValidStreamController.sink;
  @override
  login() async {
    //   TODO: implement login
    (await loginUsecase.execute(
            LoginUsecaseInput(loginObject.userName, loginObject.password)))
        .fold(
            (failure) => {
                  //left-->failure
                  print("failure ${failure.message}"),
                },
            (data) => {
                  //right-->success
                  print(data.customer?.name),
                });
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); //data class operation same as kotlin
    _validate();
  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    _validate();
  }

//output
  @override
  // TODO: implement outputIsAllInputsValid
  Stream<bool> get outputIsAllInputsValid =>
      _isAllInputsValidStreamController.stream.map((_) => _isAllInputsValid());

  @override
  // TODO: implement outputIsPasswordValid
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  // TODO: implement outputIsUserValid
  Stream<bool> get outputIsUserValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  bool _isAllInputsValid() {
    return _isUserNameValid(loginObject.userName) &&
        _isPasswordValid(loginObject.password);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  _validate() {
    inputIsAllInputsValid.add(null);
  }
}

mixin LoginViewModelInputs {
  //three functions for actions
  setUserName(String userName);
  setPassword(String password);
  login();
  //tow sink for stream
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputsValid;
}

mixin LoginViewModelOutputs {
  //tow stream because we have two sink
  Stream<bool> get outputIsUserValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputsValid;
}
