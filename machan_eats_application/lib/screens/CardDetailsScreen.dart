import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/screens/CardDetailsForm.dart';

class CardDetailsScreen extends StatelessWidget {
  final FocusNode _nameOntheCardFocusNode = FocusNode();
  final FocusNode _cardNumberFocusNode = FocusNode();
  final FocusNode _expirationDateFocusNode = FocusNode();
  final FocusNode _cvvFocusNode = FocusNode();
  final FocusNode _amountFocusNode = FocusNode();



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _nameOntheCardFocusNode.unfocus();
        _cardNumberFocusNode.unfocus();
        _expirationDateFocusNode.unfocus();
        _cvvFocusNode.unfocus();
        _amountFocusNode.unfocus();

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
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20,),
            child:CardDetailsForm (
              nameOntheCardFocusNode: _nameOntheCardFocusNode,
              cardNumberFocusNode: _cardNumberFocusNode,
              expirationDateFocusNode: _expirationDateFocusNode,
              cvvFocusNode: _cvvFocusNode,
              amountFocusNode: _amountFocusNode,
            ),
          ),
        ),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: 1,
          )),
    );
  }
}
