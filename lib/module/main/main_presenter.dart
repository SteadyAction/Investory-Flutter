import 'package:investory/module/common/presenter.dart';
import 'package:investory/module/main/main_state.dart';

class MainPresenter extends Presenter<MainState> {

  MainPresenter(super.state);

  void presentTab(int index) {
    state.rebuild(() { 
      state.currentTabIndex = index;
    });
  }
}