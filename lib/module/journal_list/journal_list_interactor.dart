import 'dart:async';

import 'package:flutter/material.dart';
import 'package:investory/module/common/interactor.dart';
import 'package:investory/module/journal_list/journal_list_module.dart';
import 'package:investory/module/journal_list/journal_list_presenter.dart';
import 'package:investory/service/haptic_service.dart';
import 'package:investory/service/log_service.dart';

class JournalListInteractor extends Interactor<JournalListPresenter> {
  
  JournalListInteractor(super.presenter, JournalListModuleInputData inputData);

  bool _shouldHandleListViewReachingEnd = true;

  void handleCreateButtonTapped() {
    LogService.instance.logEvent("journal_list_create_journal_tapped");
    HapticService.lightImpact();
  }

  void handleScollUpdate(ScrollMetrics metrics) {
    if (metrics.axis == Axis.horizontal) { return; }
    final offset = metrics.pixels;
    presenter.presentTopBar(offset);

    if (metrics.maxScrollExtent - 30 < offset && _shouldHandleListViewReachingEnd) {
      _shouldHandleListViewReachingEnd = false;
      Timer(const Duration(milliseconds: 500), () { _shouldHandleListViewReachingEnd = true; });
      _loadJournals();
    }
  }

  void _loadJournals() async {
    
  }
}