import 'package:clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/color_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController(initialPage: 0);

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(
            title: AppStrings.onBoardingTitle1,
            subTitle: AppStrings.onBoardingSubTitle1,
            image: ImageAssets.onboardingLogo1),
        SliderObject(
            title: AppStrings.onBoardingTitle2,
            subTitle: AppStrings.onBoardingSubTitle2,
            image: ImageAssets.onboardingLogo2),
        SliderObject(
            title: AppStrings.onBoardingTitle3,
            subTitle: AppStrings.onBoardingSubTitle3,
            image: ImageAssets.onboardingLogo3),
        SliderObject(
            title: AppStrings.onBoardingTitle4,
            subTitle: AppStrings.onBoardingSubTitle4,
            image: ImageAssets.onboardingLogo4),
      ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,

      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
      ),

      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderObject: _list[_currentIndex]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child:  Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall,
                )),
          ),
          _getBottomSheetWidget()
        ]),
      ),
    );
  }


  Widget _getBottomSheetWidget() {
    return Container(
      color:ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.leftArrowIc,
                ),
              ),
              onTap: () {
                //go to previous
                _pageController.animateToPage(_getPreviousIndex(),
                    duration:const Duration(milliseconds:  DurationConstant.d300),
                    curve: Curves.bounceInOut

                );
              },
            ),
          ),

          //circle indicator
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          //circle indicator


          //left arrow
          Padding(
            //go to next
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(
                  ImageAssets.rightArrowIc,
                ),
              ),
              onTap: () {
                _pageController.animateToPage(_getNextIndex(),
                    duration:const Duration(milliseconds:  DurationConstant.d300),
                    curve: Curves.bounceInOut
                );



              },
            ),
          ),
        ],
      ),
    );
  }

  int _getPreviousIndex(){
    int previousIndex = _currentIndex - 1;
    if(previousIndex == -1){
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex(){
    int nextIndex = _currentIndex + 1;
    if(nextIndex >= _list.length){
      nextIndex = 0;
    }
    return nextIndex;
  }

  Widget _getProperCircle(int index) {
    if (_currentIndex == index) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);//selected slider
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);//unselected slider
    }
  }
}
class OnBoardingPage extends StatelessWidget {
  SliderObject sliderObject;
  OnBoardingPage({super.key, required this.sliderObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.subTitle.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(
          sliderObject.image.toString(),
        ),
      ],
    );
  }
}

class SliderObject {
  String? title;
  String? subTitle;
  String? image;
  SliderObject(
      {required this.title, required this.subTitle, required this.image});
}
