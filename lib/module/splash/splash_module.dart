import 'package:flutter/material.dart';
import 'package:investory/module/splash/splash_state.dart';

class SplashModule extends StatefulWidget {

  final SplashModuleInputData inputData;

  const SplashModule(this.inputData, {super.key});


  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashModuleInputData {

  SplashModuleInputData();
}
