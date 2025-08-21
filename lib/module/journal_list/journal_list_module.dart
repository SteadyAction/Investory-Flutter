import 'package:investory/module/journal_list/journal_list_state.dart';
import 'package:flutter/material.dart';

class JournalListModule extends StatefulWidget {

  final JournalListModuleInputData inputData;

  const JournalListModule(this.inputData, {super.key});


  @override
  State<StatefulWidget> createState() {
    return JournalListState();
  }
}

class JournalListModuleInputData {
  String? text;

  JournalListModuleInputData({this.text});
}
