import 'package:investory/module/sample/sample_state.dart';
import 'package:flutter/material.dart';

class SampleModule extends StatefulWidget {

  final SampleModuleInputData inputData;

  const SampleModule(this.inputData, {super.key});


  @override
  State<StatefulWidget> createState() {
    return SampleState();
  }
}

class SampleModuleInputData {
  String? text;

  SampleModuleInputData({this.text});
}
