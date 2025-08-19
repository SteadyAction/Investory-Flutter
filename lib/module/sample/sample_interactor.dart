import 'package:investory/module/common/interactor.dart';
import 'package:investory/module/sample/sample_module.dart';
import 'package:investory/module/sample/sample_presenter.dart';

class SampleInteractor extends Interactor<SamplePresenter> {

  String text;
  
  SampleInteractor(super.presenter, SampleModuleInputData inputData)
    : text = inputData.text ?? "Default Text";
}