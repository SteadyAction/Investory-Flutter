import 'package:investory/extension/bool_extension.dart';
import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/module/common/module_state.dart';
import 'package:flutter/material.dart';
import 'package:investory/property/app_color.dart';
import 'package:investory/widget/app_text.dart';

class Presenter<S extends ModuleState<dynamic, dynamic>> {
  
  final S state;

  Presenter(this.state);

  // void routeTo(String path, {Map<String, String>? queryParams}) {
  //   state.routeTo(path, queryParams: queryParams);
  // }

  void pushModule(StatefulWidget module) {
    state.pushModule(module);
  }

  void pushCoverModuleWithCompletion(StatefulWidget module, Function onCompletion) {
    state.pushCoverModuleWithCompletion(module, onCompletion);
  }

  void pushModuleWithCompletion(StatefulWidget module, Function onCompletion) {
    state.pushModuleWithCompletion(module, onCompletion);
  }

  void pushFadeInModule(StatefulWidget module) {
    state.pushFadeInModule(module);
  }

  void pushReplacementModule(StatefulWidget module) {
    state.pushReplacementModule(module);
  }

  void pushReplacementModuleWithCompletion(StatefulWidget module, Function()? onCompletion) {
    state.pushReplacementModuleWithCompletion(module, onCompletion);
  }

  void popAllAndPush(StatefulWidget module) {
    state.popAllAndPush(module);
  }

  void popModule() {
    state.popModule();
  }

  void presentSnackBar(String message, Color color, {int seconds = 3, bool isFloating=false}) {
    final backgroundColor = color;

    if (state.mounted.not) { return; }

    ScaffoldMessenger.of(state.context).showSnackBar(
      SnackBar(
        behavior: isFloating ? SnackBarBehavior.floating : SnackBarBehavior.fixed,
        duration: Duration(seconds: seconds),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
        content: AppText(
          message,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColor.primaryText).withDefault
        )
      )
    );
  }
}