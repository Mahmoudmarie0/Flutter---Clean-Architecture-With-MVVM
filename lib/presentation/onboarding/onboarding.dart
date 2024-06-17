import 'package:clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController(initialPage: 0);
  List<SliderObject> _getSliderData() => [
    SliderObject(
      title: AppStrings.onBoardingTitle1,
      subTitle: AppStrings.onBoardingSubTitle1,
      image: ImageAssets.onboardingLogo1
    ),
    SliderObject(
      title: AppStrings.onBoardingTitle2,
      subTitle: AppStrings.onBoardingSubTitle2,
      image: ImageAssets.onboardingLogo2
    ),
    SliderObject(
      title: AppStrings.onBoardingTitle3,
      subTitle:AppStrings.onBoardingSubTitle3,
      image: ImageAssets.onboardingLogo3
    ),
    SliderObject(
      title: AppStrings.onBoardingTitle4,
      subTitle: AppStrings.onBoardingSubTitle4,
      image: ImageAssets.onboardingLogo4
    ),
  ];
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: AppSize.s1_5,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light
        ),

      ) ,
      backgroundColor: ColorManager.white,
      body: PageView.builder(
          controller:_pageController ,
          itemCount: _list.length,
          onPageChanged:(index){
            _currentIndex = index;
          } ,

          itemBuilder:(context,index){
            //return OnBoardingPage(sliderObject: _list[_currentIndex]);
          }


      ),
    );
  }
}


class SliderObject{
  String ?title;
  String ?subTitle;
  String ?image;
  SliderObject({
    required this.title,
    required this.subTitle,
    required this.image
  });
}
