// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machan_eats_application/scr/screens/show_delivery_details.dart';

import 'package:machan_eats_application/validators/delivery_database.dart';

import '../../custom_form_field_delivery.dart';

class Delivery extends StatefulWidget {
  final FocusNode streetFocusNode;
  final FocusNode cityFocusNode;
  final FocusNode countryFocusNode;
  final FocusNode recieverNameFocusNode;
  final FocusNode mobileNumFocusNode;

  const Delivery({
    required this.streetFocusNode,
    required this.cityFocusNode,
    required this.countryFocusNode,
    required this.recieverNameFocusNode,
    required this.mobileNumFocusNode,
  });

  @override
  _DeliveryState createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  final _addDeliveryDetailsFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _recieverNameController = TextEditingController();
  final TextEditingController _mobileNumController = TextEditingController();

  String getStreet = "";
  String getCity = "";
  String getCountry = "";
  String getRecieverName = "";
  String getMobileNum = "";

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
                      initialValue: "",
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
                          getStreet = value;

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
                      initialValue: "",
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
                        getCity = value;

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
                      initialValue: "",
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
                        getCountry = value;

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
                      initialValue: "",
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
                        getRecieverName = value;

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
                      height: 10,
                    ),
                    CustomFormField(
                      initialValue: "",
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
                        getMobileNum = value;

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
                            // SnackBar(content: Text("Delivery Details Added Successfully"));

                            SnackBar(
                              content: const Text('Delivery Details Added'),
                            );
                          });

                          await Delivery_Database.addDeliveryDetails(
                              street: getStreet,
                              city: getCity,
                              country: getCountry,
                              recieverName: getRecieverName,
                              mobileNum: getMobileNum);

                          setState(() {
                            _isProcessing = false;
                          });
                          final snackBar = SnackBar(
                            content: const Text('Delivery Details Added !'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ShowDetails(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                          child: Text('Confirm Delivery Details',
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
