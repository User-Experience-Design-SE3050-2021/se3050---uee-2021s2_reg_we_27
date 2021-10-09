import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/custom_form_field.dart';
import 'package:machan_eats_application/screens/EventsView.dart';
import 'package:machan_eats_application/validators/database.dart';
import 'package:machan_eats_application/validators/validator.dart';



class CardDetailsForm extends StatefulWidget {
  final FocusNode nameOntheCardFocusNode;
  final FocusNode cardNumberFocusNode;
  final FocusNode expirationDateFocusNode;
  final FocusNode cvvFocusNode;
  final FocusNode amountFocusNode;



  const CardDetailsForm({
    required this.nameOntheCardFocusNode,
    required this.cardNumberFocusNode,
    required this.expirationDateFocusNode,
    required this.cvvFocusNode,
    required this.amountFocusNode,

  });

  @override
  _CardDetailsFormState createState() => _CardDetailsFormState();
}

class _CardDetailsFormState extends State<CardDetailsForm> {
  final _cardDetailsFormKey = GlobalKey<FormState>();

  bool _isProcessing = false;

  final TextEditingController _nameOntheCardController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String getNameOnCard = "";
  String getCardNumber = "";
  String getExpirationDate = "";
  String getCvv = "";
  String getAmount = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _cardDetailsFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 24.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 25.0, right: 80.0,bottom: 10.0),
                    child: Text(
                      'Payment Details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Name on the Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled:false,
                    controller: _nameOntheCardController,
                    focusNode:widget.nameOntheCardFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getNameOnCard = value;
                    },
                    label: 'Name On the Card',
                    hint: 'Enter your Name',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Card Number',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                   // maxLines: 5,
                    isLabelEnabled:false,
                    controller: _cardNumberController,
                    focusNode:widget.cardNumberFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getCardNumber = value;
                    },
                    label: 'Card Number',
                    hint: 'Enter your CardNumber',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Expiration date/ Year',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled:false,
                    controller: _expirationDateController,
                    focusNode:widget.expirationDateFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getExpirationDate = value;
                    },
                    label: 'Expiration Date/ Year',
                    hint: 'Enter Expiration date and Year',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'CVV',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    isLabelEnabled:false,
                    controller: _cvvController,
                    focusNode:widget.cvvFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getCvv = value;
                    },
                    label: 'Cvv',
                    hint: 'Enter Cvv',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Total Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    // maxLines: 5,
                    isLabelEnabled:false,
                    controller: _amountController,
                    focusNode:widget.amountFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    validator: (value) {
                      Validator.validateField(
                          value: value
                      );
                      getAmount = value;
                    },
                    label: 'Total Amount',
                    hint: 'Enter your Total Amount',
                  ),
                ],
              ),
            ),
            _isProcessing
                ?Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
              ),
            ) : Container(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed:() async{
                  widget.nameOntheCardFocusNode.unfocus();
                  widget.cardNumberFocusNode.unfocus();
                  widget.expirationDateFocusNode.unfocus();
                  widget.cvvFocusNode.unfocus();
                  widget.amountFocusNode.unfocus();
                  if(_cardDetailsFormKey.currentState!.validate()){
                    setState(() {
                      _isProcessing = true;
                    });

                    await Database.addCard(nameOnCard: getNameOnCard, cardNumber: getCardNumber, expirationDate: getExpirationDate, cvv: getCvv, amount :getAmount);
                    setState(() {
                      _isProcessing = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventsView(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0,bottom: 16.0),
                  child: Text(
                    'Pay',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
