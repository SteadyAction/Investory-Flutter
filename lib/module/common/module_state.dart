import 'package:flutter/material.dart';
import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/module/common/interactor.dart';
import 'package:investory/property/app_color.dart';
import 'package:investory/transition_route/fade_transition_route.dart';
import 'package:investory/transition_route/slide_bottom_up_transition_route.dart';
import 'package:investory/widget/action_bottom_sheet_view.dart';
import 'package:investory/widget/bottom_sheet_view.dart';

abstract class ModuleState<M extends StatefulWidget, I extends Interactor> extends State<M> {
  
  late final I interactor;
  
  ModuleState();
  
  @override
  void initState() {
    super.initState();

    interactor.stateInitialized(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      interactor.stateInitializedWithFrame(context);
    });
  }
  
  @override
  void dispose() {
    interactor.dispose();
    super.dispose();
  }
  
  // void rebuild() {
  //   if (!mounted) { return; }
  //   setState(() {});
  // }

  void rebuild(VoidCallback codeBlock) {
    if (!mounted) return;
  
    try {
      setState(codeBlock);
    } catch (e) {
      debugPrint('rebuild error: $e');
    }
  }
  
  void pushModule(StatefulWidget module) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => module)
    );
  }

  void pushFadeInModule(StatefulWidget module) {
    Navigator.push(
      context,
      FadeTransitionRoute(module)
    );
  }

  void pushModuleWithCompletion(StatefulWidget module, Function onCompletion) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => module)
    ).whenComplete(() { onCompletion(); });
  }

  void popAllAndPush(StatefulWidget module) {
    Navigator.pushAndRemoveUntil(context, FadeTransitionRoute(module), (route) => false);
  }

  void pushReplacementModule(StatefulWidget module) {
    Navigator.pushReplacement(
      context,
      FadeTransitionRoute(module)
    );
  }

  void pushReplacementModuleWithCompletion(StatefulWidget module, Function()? onCompletion) {
    Navigator.pushReplacement(
      context,
      FadeTransitionRoute(module)
    ).then((value) { 
      onCompletion?.call();
    });
  }

  void pushCoverModuleWithCompletion(StatefulWidget module, Function onCompletion, {Duration transitionDuration=const Duration(milliseconds: 300)}) {
    Navigator.push(
      context,
      SlideBottomUpTransitionRoute(module, transitionDruation: transitionDuration)
    ).whenComplete(() { onCompletion(); });
  }

  void popModule() {
    Navigator.maybePop(context);
  }

  void forcePopModule() {
    Navigator.pop(context);
  }

  void showBottomSheetView(String title, String message, Function onClose) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      context: context,
      builder: (builderContext) { 
        return BottomSheetView(title, message, onClose);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
  void showModuleAsBottomSheet(Widget module) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      barrierColor: AppColor.black.withValues(alpha: 0.5) ,
      context: context,
      builder: (builderContext) { 
        return module;
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      clipBehavior: Clip.antiAlias
    );
  }

  void showActionBottomSheetView(List<ActionBottomSheetItem> items, Color? color, {bool isScrollControlled=false}) {
    showModalBottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: isScrollControlled,
      context: context,
      builder: (builderContext) { 
        return ActionBottomSheetView(items, color: color);
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
    );
  }

  void showAlertDialog(String? title, String? message, List<Widget> Function(BuildContext) actions) {
    showDialog(context: context, builder: (builderContext) {
      return AlertDialog(
        actionsPadding: const EdgeInsets.only(bottom: 8),
        backgroundColor: AppColor.primaryBackground,
        surfaceTintColor: AppColor.clear,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: title == null 
          ? null 
          : Text(title, 
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryText
              ).withDefault
            ),
        content: message == null ? null : Text(
          message,
          style: TextStyle(
            fontSize: 13,
            color: AppColor.secondaryText,
            fontWeight: FontWeight.w500,
          ).withDefault),
        actions: actions(builderContext)
        
      );
    });
  }
}
