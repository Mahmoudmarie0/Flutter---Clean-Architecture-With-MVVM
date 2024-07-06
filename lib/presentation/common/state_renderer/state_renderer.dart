import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../data/mapper/mapper.dart';
import '../../../data/network/failure.dart';

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
  Function retryActionFunction;

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
    return const Placeholder();
  }


  Widget _getStateWidget(){
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        // TODO: Handle this case.
      case StateRendererType.POPUP_ERROR_STATE:
        // TODO: Handle this case.
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        // _getItemsInColummn()
           // break;
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        // TODO: Handle this case.
      case StateRendererType.CONTENT_SCREEN_STATE:
        // TODO: Handle this case.
      case StateRendererType.EMPTY_SCREEN_STATE:
        // TODO: Handle this case.
      default:
        return Container();
    }
  }

  Widget _getItemsInColummn(List<Widget> children){
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,







      ),
    );


  }


}
