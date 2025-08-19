import 'package:investory/module/common/presenter.dart';
import 'package:flutter/material.dart';

abstract class Interactor<P extends Presenter> {

  final P presenter;

  Interactor(this.presenter);

  void stateInitialized(BuildContext context) {}

  void stateInitializedWithFrame(BuildContext context) {}
  
  void dispose() {}
}