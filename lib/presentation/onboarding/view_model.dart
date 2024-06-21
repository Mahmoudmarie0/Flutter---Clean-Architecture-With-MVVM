class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs,OnBoardingViewModelOutputs{ {
//stream controllers
//input
  @override
  void start() {
  }


  @override
  void dispose() {
  }


  @override
  void goNext() {
  }

  @override
  void goPrevious() {
  }

  @override
  void onPageChanged(int index) {
  }


}


//inputs mean the orders that our view model will recieve from view
abstract class OnBoardingViewModelInputs{
  void goNext();//when user clicks on right arrow or swipe
void goPrevious();//when user clicks on left arrow or swipe
void onPageChanged(int index);//when page is changed
}


//outputs mean data or results that will be sent from our view model to our view
abstract class OnBoardingViewModelOutputs {
  //will implement this later

}