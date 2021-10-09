import 'package:flutter/material.dart';
import 'package:machan_eats_application/screens/addNewEventForm.dart';

class AddEventScreen extends StatelessWidget {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();
  final FocusNode _noOfInvitesFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _startingTimeFocusNode = FocusNode();
  final FocusNode _closingTimeFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
        _noOfInvitesFocusNode.unfocus();
        _dateFocusNode.unfocus();
        _startingTimeFocusNode.unfocus();
        _closingTimeFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Padding(
            padding: EdgeInsets.only(left: 50.0, top: 5.0),
            child: Text(
              'Machan Eats',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,),
            child:AddEventForm (
                titleFocusNode: _titleFocusNode,
                descriptionFocusNode: _descriptionFocusNode,
                noOfInvitesFocusNode: _noOfInvitesFocusNode,
                dateFocusNode: _dateFocusNode,
                startingTimeFocusNode: _startingTimeFocusNode,
                closingTimeFocusNode: _closingTimeFocusNode,

            ),
          ),
        ),
      ),
    );
  }
}
