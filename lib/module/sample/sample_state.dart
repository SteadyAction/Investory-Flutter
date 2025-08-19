import 'package:investory/module/common/module_state.dart';
import 'package:investory/module/sample/sample_interactor.dart';
import 'package:investory/module/sample/sample_module.dart';
import 'package:investory/module/sample/sample_presenter.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/material.dart';

class SampleState extends ModuleState<SampleModule, SampleInteractor> {

  @override
  void initState() {
    interactor = SampleInteractor(SamplePresenter(this), widget.inputData);
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
            Text(interactor.text, style: TextStyle(color: AppColor.primaryText))
          ]
        )
      )
    );
  }
  
}