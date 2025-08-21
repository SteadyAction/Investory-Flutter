import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:investory/module/common/module_state.dart';
import 'package:investory/module/journal_list/journal_list_module.dart';
import 'package:investory/module/main/main_interactor.dart';
import 'package:investory/module/main/main_module.dart';
import 'package:investory/module/main/main_presenter.dart';
import 'package:investory/module/sample/sample_module.dart';
import 'package:investory/property/app_color.dart';

class MainState extends ModuleState<MainModule, MainInteractor> with WidgetsBindingObserver {

  int currentTabIndex = 0;

  late final Widget journalListModule;
  late final Widget settingsModule;

  @override
  void initState() {
    interactor = MainInteractor(MainPresenter(this), widget.inputData);
    super.initState();
    
    WidgetsBinding.instance.addObserver(this);
    
    journalListModule = JournalListModule(JournalListModuleInputData());
    settingsModule = SampleModule(SampleModuleInputData());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        interactor.handleModuleResumed();
        break;
      case AppLifecycleState.inactive:
        interactor.handleModuleBecameInactive();
        break;
      case AppLifecycleState.paused:
        interactor.handleModulePaused();
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColor.primaryBackground,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: modules()
                ),
                CupertinoTabBar(
                  border: null,
                  backgroundColor: AppColor.primaryBackground,
                  activeColor: AppColor.secondaryText,
                  inactiveColor: AppColor.quaternaryText,
                  onTap: (index) {
                    interactor.handleTabTapped(index);
                  },
                  iconSize: 24,
                  currentIndex: currentTabIndex,
                  items: menus()
                ),
              ]
            ),
          )
        ),
      ],
    );
  }

  IndexedStack modules() {
    var list = [journalListModule, settingsModule];
    return IndexedStack(
      index: currentTabIndex,
      children: list
    ); 
  }

  List<BottomNavigationBarItem> menus() {
    var list = [
      const BottomNavigationBarItem(icon: 
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8, bottom: 0),
          child: ImageIcon(AssetImage("assets/images/checklist.png"), size: 26),
        ),
      ),
      const BottomNavigationBarItem(icon: 
        Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: ImageIcon(AssetImage("assets/images/person.png"), size: 22),
        ),
      ),
    ];

    return list; 
  }
}


