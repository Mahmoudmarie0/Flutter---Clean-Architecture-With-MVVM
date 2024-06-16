import 'package:clean_architecture_with_mvvm/presentation/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
  //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor:  ColorManager.grey1, //will be used incase of disabled buttons for example
    hintColor: ColorManager.grey,


  );
}
