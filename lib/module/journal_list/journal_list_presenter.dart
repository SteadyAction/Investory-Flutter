import 'package:investory/extension/bool_extension.dart';
import 'package:investory/module/common/presenter.dart';
import 'package:investory/module/journal_list/journal_list_state.dart';

class JournalListPresenter extends Presenter<JournalListState> {
  
  JournalListPresenter(super.state);

  void presentTopBar(double offset) {
    const changerOffset = 12;
    if ((state.showingTopBar.value.not && offset > changerOffset) ||
        (state.showingTopBar.value && offset < changerOffset)) {
      state.showingTopBar.value = state.showingTopBar.value.not;
    }
  }

}