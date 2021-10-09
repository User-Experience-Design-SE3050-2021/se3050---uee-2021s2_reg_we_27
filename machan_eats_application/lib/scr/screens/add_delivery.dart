import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'bottom_nav.dart';
import 'commons.dart';
import 'delivery.dart';

class AddDelivery extends StatelessWidget {
  final FocusNode _streetFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();
  final FocusNode _recieverNameFocusNode = FocusNode();
  final FocusNode _mobileNumFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _streetFocusNode.unfocus();
        _cityFocusNode.unfocus();
        _countryFocusNode.unfocus();
        _recieverNameFocusNode.unfocus();
        _mobileNumFocusNode.unfocus();
      },
      child: Scaffold(
          backgroundColor: black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.amber,
            title: AppBarTitle(
              sectionName: 'App',
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                bottom: 20.0,
              ),
              child: Delivery(
                streetFocusNode: _streetFocusNode,
                cityFocusNode: _cityFocusNode,
                countryFocusNode: _countryFocusNode,
                recieverNameFocusNode: _recieverNameFocusNode,
                mobileNumFocusNode: _mobileNumFocusNode,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: 1,
          )),
    );
  }
}
