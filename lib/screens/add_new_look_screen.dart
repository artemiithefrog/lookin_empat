import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lookin_empat/base_app_bar.dart';

import '../widgets/scrollable_section_widget.dart';

class AddNewLookScreen extends StatefulWidget{
  const AddNewLookScreen({super.key});

  @override
  State<AddNewLookScreen> createState() => _AddNewLookScreenState();
}

class _AddNewLookScreenState extends State<AddNewLookScreen> {

  late List<ScrollableSectionWidget> clothingSections;

  void _onAppBarAddButtonPressed() {
    // open sections screen,
    // onSectionPressed should return id of pressed section
    // onPressedActive true
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        onRightWidgetPressed: _onAppBarAddButtonPressed,
      ),
      body: ListView(
        children: [...clothingSections],
      ),
    );
  }
}