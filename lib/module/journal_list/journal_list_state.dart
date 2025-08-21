import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/module/common/module_state.dart';
import 'package:investory/module/journal_list/journal_list_interactor.dart';
import 'package:investory/module/journal_list/journal_list_module.dart';
import 'package:investory/module/journal_list/journal_list_presenter.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/material.dart';
import 'package:investory/property/app_text_style.dart';
import 'package:investory/widget/app_button.dart';
import 'package:investory/widget/separator.dart';
import 'package:investory/widget/space.dart';

class JournalListState extends ModuleState<JournalListModule, JournalListInteractor> {

  final showingTopBar = ValueNotifier(false);

  @override
  void initState() {
    interactor = JournalListInteractor(JournalListPresenter(this), widget.inputData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _topBarView,
        Expanded(
          child: Stack(
            children: [
              _headerView,
              _createButton
            ],
          )
        )
      ],
    );
  }

  Widget get _createButton {
    return Align(alignment: Alignment.bottomRight,
      child: Container(
        margin: const EdgeInsets.only(right: 15, bottom: 30),
        child: IntrinsicHeight(
          child: IntrinsicWidth(
            child: AppButton(
              radius: 15,
              backgroundColor: AppColor.blue5,
              onTapped: () { interactor.handleCreateButtonTapped(); },
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 18, right: 18),
                child: Row(
                  children: [
                    const ImageIcon (
                      AssetImage("assets/images/plus.png"),
                      color: AppColor.primaryText,
                      size: 20,
                    ),
                  ]
                )
              )
            )
          )
        )
      ), 
    );
  }

  Widget get _headerView {
    return ValueListenableBuilder<bool>(
      valueListenable: showingTopBar,
      builder: (context, showing, child) {
        return  AnimatedOpacity(
          opacity: showing ? 0 : 1,
          duration: const Duration(milliseconds: 250),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: SizedBox(
              width: double.infinity,
              child: Text("Journals", style: AppTextStyle.header)
            )
          )
        );
      }
    );
  }

  Widget get _topBarView {
    return ValueListenableBuilder<bool>(
      valueListenable: showingTopBar,
      builder: (context, showing, child) {
        return AnimatedOpacity(
          opacity: showing ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Journals",
                    style: AppTextStyle.barTitle,
                  )
                )
              ),
              const Separator(color: AppColor.secondarySeparator)
            ],
          ) 
        );
      },
    );
  }
}