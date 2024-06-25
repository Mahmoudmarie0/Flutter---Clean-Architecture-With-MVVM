import 'dart:async';

import 'package:clean_architecture_with_mvvm/domain/model.dart';
import 'package:clean_architecture_with_mvvm/presentation/base/baseviewmodel.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
  late final List<SliderObject> _list ;
  int _currentIndex = 0;
//stream controllers
final StreamController<SliderViewObject> _streamController = StreamController<SliderViewObject>();
//input
  @override
  void start() {
_list = _getSliderData();
//send this data to our view
    _postDataToView();


  }


  @override
  void dispose() {
    _streamController.close();
  }


  @override
  int goNext() {
    int nextIndex = _currentIndex + 1;
    if(nextIndex >= _list.length){
      nextIndex = 0;
    }
  return _currentIndex;

  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex - 1;
    if(previousIndex == -1){
      previousIndex = _list.length - 1;
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();


  }

  @override
  //  implement outputSliderViewObject
  //recieve slider object
  //do anything that object receives
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((SliderViewObject) => SliderViewObject);
  //private function
  List<SliderObject> _getSliderData() =>
      [
        SliderObject(
            AppStrings.onBoardingTitle1,
             AppStrings.onBoardingSubTitle1,
           ImageAssets.onboardingLogo1),
        SliderObject(
             AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2,
          ImageAssets.onboardingLogo2),
        SliderObject(
            AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3,
            ImageAssets.onboardingLogo3),
        SliderObject(
            AppStrings.onBoardingTitle4,
             AppStrings.onBoardingSubTitle4,
             ImageAssets.onboardingLogo4),
      ];

//private function
  void _postDataToView(){
inputSliderViewObject.add( SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }


  @override
  //  implement sliderViewObject
  //add slider object
  Sink get inputSliderViewObject => _streamController.sink;


}


//inputs mean the orders that our view model will recieve from view
mixin OnBoardingViewModelInputs{
 void goNext();//when user clicks on right arrow or swipe
 void goPrevious();//when user clicks on left arrow or swipe
void onPageChanged(int index);
Sink get inputSliderViewObject;  //way to add data to stream
}


//outputs mean data or results that will be sent from our view model to our view
mixin OnBoardingViewModelOutputs {
  Stream <SliderViewObject> get outputSliderViewObject;
  //will implement this later

}

class SliderViewObject{
  SliderObject sliderObject;
 int numOfSlides;
 int currentIndex;
 SliderViewObject( this.sliderObject, this.numOfSlides, this.currentIndex);
}