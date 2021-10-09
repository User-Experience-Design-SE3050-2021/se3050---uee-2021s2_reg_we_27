import 'package:flutter/material.dart';
import '../app_bar.dart';
import 'addTableBookingForm.dart';

class AddTableBookingScreen extends StatelessWidget {
  final FocusNode _purposeFocusNode = FocusNode();
  final FocusNode _branchFocusNode = FocusNode();
  final FocusNode _tableSizeFocusNode = FocusNode();
  final FocusNode _decorationThemeFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _purposeFocusNode.unfocus();
        _branchFocusNode.unfocus();
        _tableSizeFocusNode.unfocus();
        _decorationThemeFocusNode.unfocus();
        _dateFocusNode.unfocus();
        _timeFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          title: AppBarTitle(
            sectionName: '',
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,bottom: 20.0,),
            child: AddTableBookingForm(
              purposeFocusNode: _purposeFocusNode,
              branchFocusNode: _branchFocusNode,
              tableSizeFocusNode: _tableSizeFocusNode,
              decorationThemeFocusNode: _decorationThemeFocusNode,
              dateFocusNode: _dateFocusNode,
              timeFocusNode: _timeFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}