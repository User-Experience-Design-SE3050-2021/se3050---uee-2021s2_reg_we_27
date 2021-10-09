import 'package:flutter/material.dart';
import 'package:machan_eats_application/validators/delivery_database.dart';
import 'app_bar.dart';
import 'bottom_nav.dart';
import 'commons.dart';
import 'edit_delivery_details_form.dart';

class EditDeliveryScreen extends StatefulWidget {
  final String documentId;
  final String currentStreet;
  final String currentCity;
  final String currentRecieverName;
  final String currentCountry;
  final String currentMobileNum;

  EditDeliveryScreen({
    required this.currentStreet,
    required this.currentCity,
    required this.currentRecieverName,
    required this.currentCountry,
    required this.currentMobileNum,
    required this.documentId,
  });

  @override
  _EditDeliveryScreenState createState() => _EditDeliveryScreenState();
}

class _EditDeliveryScreenState extends State<EditDeliveryScreen> {
  final FocusNode _streetFocusNode = FocusNode();
  final FocusNode _cityFocusNode = FocusNode();
  final FocusNode _countryFocusNode = FocusNode();
  final FocusNode _recieverNameFocusNode = FocusNode();
  final FocusNode _mobileNumFocusNode = FocusNode();

  bool _isDeleting = false;

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
            actions: [
              _isDeleting
                  ? Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        right: 16.0,
                      ),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.redAccent,
                        ),
                        strokeWidth: 3,
                      ),
                    )
                  : IconButton(
                      onPressed: () async {
                        setState(() {
                          _isDeleting = true;
                        });

                        await Delivery_Database.deleteDeliveryDetails(
                          docId: widget.documentId,
                        );
                        setState(() {
                          _isDeleting = false;
                        });
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: Colors.black,
                        size: 32,
                      )),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: EditDeliveryDetailsForm(
                documentId: widget.documentId,
                streetFocusNode: _streetFocusNode,
                cityFocusNode: _cityFocusNode,
                countryFocusNode: _countryFocusNode,
                recieverNameFocusNode: _recieverNameFocusNode,
                mobileNumFocusNode: _mobileNumFocusNode,
                currentStreet: widget.currentStreet,
                currentCity: widget.currentCity,
                currentRecieverName: widget.currentRecieverName,
                currentCountry: widget.currentCountry,
                currentMobileNum: widget.currentMobileNum,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavBar(
            selectedIndex: 1,
          )),
    );
  }
}
