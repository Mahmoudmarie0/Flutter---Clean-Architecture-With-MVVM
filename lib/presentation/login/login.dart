import 'package:clean_architecture_with_mvvm/presentation/login/login_viewmodel.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewmodel loginViewmodel = LoginViewmodel(null);//pass here loginUsecase
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  _bind(){
    loginViewmodel.start();
    _userNameController.addListener(()=>loginViewmodel.setUserName(_userNameController.text));
    _passwordController.addListener(()=>loginViewmodel.setPassword(_passwordController.text));
      
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    loginViewmodel.dispose();
    super.dispose();
  }

  Widget _getContentWidget(){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: AppPadding.p100),
        color: ColorManager.white,
        child: SingleChildScrollView(
          child: Form(
            key:_formKey,
            child: Column(
              children: [
                SvgPicture.asset(ImageAssets.logoIcon),
                SizedBox(height: AppSize.s28 ,),
                Padding(padding: EdgeInsets.only(left: AppPadding.p28, right: AppPadding.p28),
                  child: StreamBuilder<bool>(
                    stream: loginViewmodel.outputIsUserValid,
                    builder: (context,snapshot){
                      return TextFormField(
                        controller: _userNameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: AppStrings.userName,
                          labelText: AppStrings.userName,
                          errorText: (snapshot.data ?? true) ? null : AppStrings.userNameError,
                        ),
                      );

                    },

                  ),

                  )

              ],
            ) ,
          ),

        ),
      ),


    );
  }


  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
