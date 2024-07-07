import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/styles_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../data/mapper/mapper.dart';
import '../../../data/network/failure.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';

enum StateRendererType {
  // pop up states
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,

  // full screen states
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,
  CONTENT_SCREEN_STATE,
  EMPTY_SCREEN_STATE, //Empty content screen WHEN WE RECIEVE NO DATA FROM API
}

class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  Failure failure;
  String message;
  String title;
  Function? retryActionFunction;

  StateRenderer(
      {required this.stateRendererType,
      Failure? failure,
      String? message,
      String? title,
      required this.retryActionFunction,
      super.key})
      : message = message ?? AppStrings.login,
        title = title ?? EMPTY,
        failure = failure ?? DefaultFailure();

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopupDialog(context,)
      // TODO: Handle this case.
      case StateRendererType.POPUP_ERROR_STATE:
      // TODO: Handle this case.
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColummn([_getAnimatedImages(), _getMessage(message)]);

      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColummn([
          _getAnimatedImages(),
          _getMessage(failure.message),
          _getRetryButton(AppStrings.retry_again, context)
        ]);

      // TODO: Handle this case.
      case StateRendererType.CONTENT_SCREEN_STATE:
      // TODO: Handle this case.
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColummn([
          _getAnimatedImages(),
          _getMessage(message),
        ]);
      default:
        return Container();
    }
  }

  Widget _getPopupDialog(BuildContext context){
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.s14),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: AppSize.s12, offset: Offset(AppSize.s0, AppSize.s12))],
        ),
        child: _getDialogContent(context),
      ),


    );



  }

  Widget _getDialogContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getAnimatedImages(),
        _getMessage(message),
        _getRetryButton(AppStrings.retry_again, context)
      ],
    );
  }



  Widget _getAnimatedImages() {
    return const SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Text("dd"),
    );
  }

  Widget _getItemsInColummn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: Text(
          message,
          style: getMediumStyle(
              color: ColorManager.black, fontSize: FontSizeManager.s16),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
          width: AppSize.s180,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendererType ==
                  StateRendererType.FULL_SCREEN_ERROR_STATE) {
                retryActionFunction
                    ?.call(); //to call api function again to retry
              } else {
                //pop error screen
                Navigator.of(context)
                    .pop(); //pop error screen so we need to dismiss the dialog
              }
            },
            child: const Text("dl"),
          ),
        ),
      ),
    );
  }
}
