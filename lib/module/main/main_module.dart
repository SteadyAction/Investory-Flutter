import 'package:flutter/material.dart';
import 'package:investory/module/main/main_state.dart';

class MainModule extends StatefulWidget {

  final MainModuleInputData inputData;

  const MainModule(this.inputData, {super.key});


  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainModuleInputData {
}
