//contain all the variables and methods that are common to all view models
abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  void start(); //will be called while init of view model
  void
      dispose(); //will be called when view model is destroyed(delete from memory or navigate to another screen)
}

mixin class BaseViewModelOutputs {}
