import 'package:investory/module/common/module_state.dart';
import 'package:investory/module/splash/splash_interactor.dart';
import 'package:investory/module/splash/splash_module.dart';
import 'package:investory/module/splash/splash_presenter.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/material.dart';

class SplashState extends ModuleState<SplashModule, SplashInteractor> {

  @override
  void initState() {
    interactor = SplashInteractor(SplashPresenter(this), widget.inputData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryBackground,
      body: SafeArea(
        bottom: true,
        child: Column(
          children: [
            
          ]
        )
      )
    );
  }
  
}