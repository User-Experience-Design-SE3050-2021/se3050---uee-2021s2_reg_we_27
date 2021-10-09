import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/validators/delivery_database.dart';

import '../../custom_form_field_delivery.dart';

class EditDeliveryDetailsForm extends StatefulWidget {
  final String documentId;
  final String currentStreet;
  final String currentCity;
  final String currentRecieverName;
  final String currentCountry;
  final String currentMobileNum;

  final FocusNode streetFocusNode;
  final FocusNode cityFocusNode;
  final FocusNode countryFocusNode;
  final FocusNode recieverNameFocusNode;
  final FocusNode mobileNumFocusNode;

  const EditDeliveryDetailsForm({
    required this.documentId,
    required this.currentStreet,
    required this.currentCity,
    required this.currentRecieverName,
    required this.currentCountry,
    required this.currentMobileNum,
    required this.streetFocusNode,
    required this.cityFocusNode,
    required this.countryFocusNode,
    required this.recieverNameFocusNode,
    required this.mobileNumFocusNode,
  });

  @override
  _EditDeliveryDetailsFormState createState() =>
      _EditDeliveryDetailsFormState();
}

class _EditDeliveryDetailsFormState extends State<EditDeliveryDetailsForm> {
  final _addDeliveryDetailsFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _recieverNameController = TextEditingController();
  final TextEditingController _mobileNumController = TextEditingController();

  String updateStreet = "";
  String updateCity = "";
  String updateCountry = "";
  String updateRecieverName = "";
  String updateMobileNum = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addDeliveryDetailsFormKey,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0),
                    Text(
                      'Delivery Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 15,
                    ),
                    Text(
                      'Delivery Address:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    Divider(
                      height: 25,
                    ),
                    Text(
                      'Street:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    CustomFormField(
                      initialValue: widget.currentStreet,
                      isLabelEnabled: false,
                      controller: _streetController,
                      focusNode: widget.streetFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter street';
                        }
                        // return null;
                        updateStreet = value;

                      },
                      label: 'Street',
                      hint: 'Enter the Street',
                    ),
                    Divider(
                      height: 25,
                    ),
                    Text(
                      'City:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    CustomFormField(
                      initialValue: widget.currentCity,
                      isLabelEnabled: false,
                      controller: _cityController,
                      focusNode: widget.cityFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter city';
                        }
                        // return null;
                        updateCity = value;

                      },
                      label: 'City',
                      hint: 'Enter the City',
                    ),
                    Divider(
                      height: 25,
                    ),
                    Text(
                      'Country:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    CustomFormField(
                      initialValue: widget.currentCountry,
                      isLabelEnabled: false,
                      controller: _countryController,
                      focusNode: widget.countryFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter country ';
                        }
                        // return null;
                        updateCountry = value;

                      },
                      label: 'Country',
                      hint: 'Enter the Country',
                    ),
                    Divider(
                      height: 25,
                    ),
                    Text(
                      'Receivers Name:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    CustomFormField(
                      initialValue: widget.currentRecieverName,
                      isLabelEnabled: false,
                      controller: _recieverNameController,
                      focusNode: widget.recieverNameFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter recievers name ';
                        }
                        else if (value.length <= 3) {
                          return 'Enter Receiver name more than 3 characters';
                        }
                        // return null;
                        updateRecieverName = value;
                      },
                      label: 'Receiver Name',
                      hint: 'Enter the Receiver Name',
                    ),
                    Divider(
                      height: 25,
                    ),
                    Text(
                      'Mobile Number:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Divider(
                      height: 5,
                    ),
                    CustomFormField(
                      initialValue: widget.currentMobileNum,
                      isLabelEnabled: false,
                      controller: _mobileNumController,
                      focusNode: widget.mobileNumFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,

                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a mobile number ';
                        } else if (value.length <= 7) {
                          return 'Enter a valid mobile number';
                        }
                        // return null;
                        updateMobileNum = value;
                      },
                      label: 'Mobile Num',
                      hint: 'Enter the mobile number',
                    ),
                  ],
                )),
            Divider(
              height: 60,
            ),
            _isProcessing
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                    ),
                  )
                : Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                      ),
                      onPressed: () async {
                        widget.streetFocusNode.unfocus();
                        widget.cityFocusNode.unfocus();
                        widget.countryFocusNode.unfocus();
                        widget.recieverNameFocusNode.unfocus();
                        widget.mobileNumFocusNode.unfocus();

                        if (_addDeliveryDetailsFormKey.currentState!
                            .validate()) {
                          setState(() {
                            _isProcessing = true;

                            SnackBar(
                              content: const Text('Delivery Details Added'),
                            );
                          });

                          await Delivery_Database.updateDeliveryDetails(
                              docId: widget.documentId,
                              street: updateStreet,
                              city: updateCity,
                              country: updateCountry,
                              recieverName: updateRecieverName,
                              mobileNum: updateMobileNum);

                          setState(() {
                            _isProcessing = false;
                          });

                          final snackBar = SnackBar(
                            content: const Text('Delivery Details Updated!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).pop();
                        }
                      },
                      child: Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: Text('Update Data',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                letterSpacing: 2,
                              ))),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
