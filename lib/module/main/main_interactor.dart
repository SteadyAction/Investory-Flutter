import 'package:flutter/material.dart';
import 'package:investory/module/common/interactor.dart';
import 'package:investory/module/main/main_module.dart';
import 'package:investory/module/main/main_presenter.dart';
import 'package:investory/service/haptic_service.dart';
import 'package:investory/service/log_service.dart';

class MainInteractor extends Interactor<MainPresenter> {

  var _currentTabIndex = 0;

  static var journalListIndex = 0;
  static var settingsIndex = 1;

  MainInteractor(super.presenter, MainModuleInputData inputData);
  
  @override
  void stateInitialized(BuildContext context) {
    super.stateInitialized(context);

    LogService.instance.logEvent("main_module_initialized");
  }

  @override
  void stateInitializedWithFrame(BuildContext context) {
    super.stateInitializedWithFrame(context);
    
  }

  void handleTabTapped(int index) {
    HapticService.lightImpact();
    
    _currentTabIndex = index;
    presenter.presentTab(_currentTabIndex);

    if (_currentTabIndex == journalListIndex) {
      LogService.instance.logEvent("journal_list_tab_tapped");
    }

    if (_currentTabIndex == settingsIndex) {
      LogService.instance.logEvent("settings_tab_tapped");
    }
  }

  void handleModuleResumed() {
    
  }

  void handleModuleBecameInactive() {

  }

  void handleModulePaused() {
     
   }
}