import 'package:investory/module/common/interactor.dart';
import 'package:investory/module/splash/splash_module.dart';
import 'package:investory/module/splash/splash_presenter.dart';

class SplashInteractor extends Interactor<SplashPresenter> {

  String text;
  
  SplashInteractor(super.presenter, SplashModuleInputData inputData)
    : text = inputData.text ?? "Default Text";
}