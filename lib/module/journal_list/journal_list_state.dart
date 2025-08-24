import 'dart:math';

import 'package:investory/extension/bool_extension.dart';
import 'package:investory/extension/text_style_extension.dart';
import 'package:investory/module/common/module_state.dart';
import 'package:investory/module/journal_list/journal_list_interactor.dart';
import 'package:investory/module/journal_list/journal_list_module.dart';
import 'package:investory/module/journal_list/journal_list_presenter.dart';
import 'package:investory/property/app_color.dart';
import 'package:flutter/material.dart';
import 'package:investory/property/app_text_style.dart';
import 'package:investory/service/platform_service.dart';
import 'package:investory/widget/app_button.dart';
import 'package:investory/widget/app_text.dart';
import 'package:investory/widget/center_max_width_view.dart';
import 'package:investory/widget/ignored_animated_opacity.dart';
import 'package:investory/widget/separator.dart';
import 'package:investory/widget/space.dart';

class JournalListState extends ModuleState<JournalListModule, JournalListInteractor> {

  static final String moduleTitle = "Journals";

  final showingTopBar = ValueNotifier(false);
  final isLoading = ValueNotifier<bool>(false);
  final journalIds = ValueNotifier<List<String>>([]);
  

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
              _listView,
              _createButton
            ],
          )
        )
      ],
    );
  }

  @override
  void dispose() {
    showingTopBar.dispose();
    isLoading.dispose();
    journalIds.dispose();
    super.dispose();
  }

  Widget get _listView {
    return ValueListenableBuilder<List<String>>(
      valueListenable: journalIds, 
      builder: (context, journalIds, child) {
        return NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              interactor.handleScollUpdate(notification.metrics);
            }
            return false;
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: _headerView),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container();
                  },
                  childCount: journalIds.length,
                ),
              ),
              SliverFillRemaining(child: _emptyView),
              SliverFillRemaining(child: _loadingView)
            ],
          ),
        );
      }
    ); 
  }


  Widget get _createButton {
    return ValueListenableBuilder<List<String>>(
      valueListenable: journalIds,
      builder: (context, journalIds, child) {
        return AnimatedOpacity(
          opacity: journalIds.isEmpty ? 0 : 1, 
          duration: const Duration(milliseconds: 200),
          child: Align(alignment: Alignment.bottomRight,
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
                      child: const ImageIcon (
                        AssetImage("assets/images/plus.png"),
                        color: AppColor.primaryText,
                        size: 20,
                      ),
                    )
                  )
                )
              )
            ), 
          )
        );
      }
    );
  }

  Widget get _headerView {
    return ValueListenableBuilder<bool>(
      valueListenable: showingTopBar,
      builder: (context, showing, child) {
        return AnimatedOpacity(
          opacity: showing ? 0 : 1,
          duration: const Duration(milliseconds: 250),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
            child: SizedBox(
              width: double.infinity,
              child: Text(moduleTitle, style: AppTextStyle.header)
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
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: PlatformService.isWeb ? 5 : 0),
                    child: Text(
                      moduleTitle,
                      style: AppTextStyle.barTitle,
                    )
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

  Widget get _emptyView {
    return ListenableBuilder(
      listenable: Listenable.merge([isLoading, journalIds]),
      builder: (context, child) {
        bool visible = !isLoading.value && journalIds.value.isEmpty;
        return IgnoredAnimatedOpacity(
          visible: visible,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage("assets/images/write_pencil.png"),
                  height: 100,
                ),
                const Space(height: 20),
                AppText(
                  "All growth starts from a record",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryText,
                  ).withDefault,
                ),
                const Space(height: 20),
                CenterMaxWidthView(
                  maxWidth: 360,
                  child: AppText(
                    "Record why you buy and sell to discover your own\ninvestment principles and reduce repeating mistakes.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.tertiaryText,
                    ).withDefault,
                  )
                ),
                const Space(height: 30),
                IntrinsicWidth(
                  child: AppButton(
                    radius: 15,
                    backgroundColor: AppColor.blue5,
                    onTapped: () { interactor.handleCreateButtonTapped(); },
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
                      child: Text(
                        "Start Journaling",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryText
                        ).withDefault,
                      )
                    )
                  )
                )
              ]
            )
          )
        );
      },
    );
  }

  Widget get _loadingView {
    return ValueListenableBuilder<bool>(
      valueListenable: isLoading,
      builder: (context, loading, child) {
        if (!loading) return const SizedBox.shrink();

        final indicatorView = const Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              color: AppColor.tertiaryText,
              strokeWidth: 3,
            ),
          )
        );

        if (journalIds.value.isEmpty) {
          final screenHeight = MediaQuery.of(context).size.height;
          return SizedBox(
            height: max(screenHeight - 200, 0),
            child: indicatorView
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: indicatorView
          );
        }
      },
    );
  }
}