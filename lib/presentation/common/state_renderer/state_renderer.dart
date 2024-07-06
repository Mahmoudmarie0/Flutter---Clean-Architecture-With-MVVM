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

  Widget _getStateWidget() {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
      // TODO: Handle this case.
      case StateRendererType.POPUP_ERROR_STATE:
      // TODO: Handle this case.
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColummn([_getAnimatedImages(), _getMessage(message)]);

      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColummn([
          _getAnimatedImages(),
          _getMessage(failure.message),
          _getRetryButton(AppStrings.retry_again)
        ]);

      // TODO: Handle this case.
      case StateRendererType.CONTENT_SCREEN_STATE:
      // TODO: Handle this case.
      case StateRendererType.EMPTY_SCREEN_STATE:
      // TODO: Handle this case.
      default:
        return Container();
    }
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
    return Text(
      message,
      style: getMediumStyle(
          color: ColorManager.black, fontSize: FontSizeManager.s16),
    );
  }

  Widget _getRetryButton(String buttonTitle) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text("dl"),
    );
  }
}
