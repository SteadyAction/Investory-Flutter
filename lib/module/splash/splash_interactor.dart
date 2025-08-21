import 'package:flutter/material.dart';
import 'package:investory/extension/bool_extension.dart';
import 'package:investory/module/common/interactor.dart';
import 'package:investory/module/splash/splash_module.dart';
import 'package:investory/module/splash/splash_presenter.dart';
import 'package:investory/service/auth_service.dart';
import 'package:investory/service/build_service.dart';
import 'package:investory/service/log_service.dart';

class SplashInteractor extends Interactor<SplashPresenter> {
  
  SplashInteractor(super.presenter, SplashModuleInputData inputData);

  @override
  void stateInitializedWithFrame(BuildContext context) {
    super.stateInitialized(context);
    _initialize();
  }

  void _initialize() async {
    try {
      if (BuildService.instance.isFirstTimeAppLaunch()) {
        LogService.instance.logEvent("first_time_launch");
      } else {
        LogService.instance.logEvent("not_first_time_launch");
      }

      if (AuthService.instance.isSignedIn.not) {
        await AuthService.instance.anonymouslySignIn();
      }

      final uid = AuthService.instance.currentUser?.uid;
      if (uid != null) {
        LogService.instance.setUserId(uid);
      }

      presenter.presentMainModule();
    } catch (e) {
      LogService.instance.logEvent("splash_error", data: {"error": e.toString()});
    }
  }
}