import 'package:investory/module/common/presenter.dart';
import 'package:investory/module/main/main_module.dart';
import 'package:investory/module/splash/splash_state.dart';

class SplashPresenter extends Presenter<SplashState> {
  
  SplashPresenter(super.state);

  presentMainModule() {
    final module = MainModule(MainModuleInputData());
    pushReplacementModule(module);
  }
}