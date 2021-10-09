// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:machan_eats_application/scr/screens/show_delivery_details.dart';

import 'package:machan_eats_application/validators/delivery_database.dart';
import 'package:machan_eats_application/validators/validator.dart';

import '../../custom_form_field.dart';



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
      padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 24.0,),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:24.0),
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
              'Delivery Address',
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
              'Street',
              style: TextStyle(
                color: Colors.amber,
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
                  Validator.validateField(
                      value: value
                  );
                  getStreet = value;
                },

                label: 'Street',
                hint: 'Enter the Street',

              ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     style: TextStyle(color: Colors.black),
            //     decoration: InputDecoration(
            //       hintText: "Enter street",
            //       border: InputBorder.none,
            //       fillColor: Colors.white, filled: true,
            //     ),
            //
            //   ),
            // ),
            Divider(
              height: 25,
            ),
            Text(
              'City',
              style: TextStyle(
                color: Colors.amber,
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
                Validator.validateField(
                    value: value
                );
                getCity = value;
              },
              label: 'City',
              hint: 'Enter the City',
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     style: TextStyle(color: Colors.black),
            //     decoration: InputDecoration(
            //       hintText: "Enter city",
            //       border: InputBorder.none,
            //       fillColor: Colors.white, filled: true,
            //     ),
            //
            //   ),
            // ),
            Divider(
              height: 25,
            ),
            Text(
              'Country',
              style: TextStyle(
                color: Colors.amber,
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
                Validator.validateField(
                    value: value
                );
                getCountry= value;
              },
              label: 'Country',
              hint: 'Enter the Country',
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     style: TextStyle(color: Colors.black),
            //     decoration: InputDecoration(
            //       hintText: "Enter country",
            //       border: InputBorder.none,
            //       fillColor: Colors.white, filled: true,
            //     ),
            //
            //   ),
            // ),
            Divider(
              height: 25,
            ),
            Text(
              'Receivers Name',
              style: TextStyle(
                color: Colors.amber,
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
                Validator.validateField(
                    value: value
                );
                getRecieverName = value;
              },
              label: 'Receiver Name',
              hint: 'Enter the Receiver Name',
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     style: TextStyle(color: Colors.black),
            //     decoration: InputDecoration(
            //       hintText: "Enter receivers name",
            //       border: InputBorder.none,
            //       fillColor: Colors.white, filled: true,
            //     ),
            //
            //   ),
            // ),
            Divider(
              height: 25,
            ),
            Text(
              'Mobile Number',
              style: TextStyle(
                color: Colors.amber,
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
                Validator.validateField(
                    value: value
                );
                getMobileNum = value;
              },
              label: 'Mobile Num',
              hint: 'Enter the mobile number',
            ),
          ],
      )
          ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextField(
            //     style: TextStyle(color: Colors.black),
            //     decoration: InputDecoration(
            //       hintText: "Enter mobile number",
            //
            //       border: InputBorder.none,
            //       fillColor: Colors.white, filled: true,
            //     ),
            //
            //   ),
            // ),

            Divider(
              height: 60,
            ),
            _isProcessing
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            ) :
            Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                ),
            // Padding(
            //   padding: EdgeInsets.only(left: 40.0, right: 40.0),
            //   child: Container(
            //     width: double.maxFinite,
            //     child: ElevatedButton(
            //       style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.amber),
            //         shape: MaterialStateProperty.all(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             )
            //         ),
            //       ),
                  onPressed: () async{

                    widget.streetFocusNode.unfocus();
                    widget.cityFocusNode.unfocus();
                    widget.countryFocusNode.unfocus();
                    widget.recieverNameFocusNode.unfocus();
                    widget.mobileNumFocusNode.unfocus();


                    if(_addDeliveryDetailsFormKey.currentState!.validate()){
                      setState(() {
                        _isProcessing = true;
                        // SnackBar(content: Text("Delivery Details Added Successfully"));

                          SnackBar(
                            content: const Text('Delivery Details Added'),

                          );

                      });


                      await Delivery_Database.addDeliveryDetails(street: getStreet, city: getCity, country: getCountry, recieverName: getRecieverName, mobileNum: getMobileNum);


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

                        // DeliveryList(),
                      );
                      // Navigator.of(context).push(
                      //
                    }

                  },




                  child: Padding(
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                    child: Text(
                      'Confirm Delivery Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        letterSpacing: 2,
                      )
                    )
                  ),
                ),
              ),
            ],

    ),
    ),
    );
  }
}
