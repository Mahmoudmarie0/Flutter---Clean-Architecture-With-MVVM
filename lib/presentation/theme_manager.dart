import 'package:clean_architecture_with_mvvm/presentation/color_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/font_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/styles_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //main colors of the app
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager
        .grey1, //will be used incase of disabled buttons for example
    splashColor: ColorManager.primaryOpacity70, //ripple effect color
    hintColor: ColorManager.grey,

    //Card view Theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    //AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s16),
    ),
  );
}
