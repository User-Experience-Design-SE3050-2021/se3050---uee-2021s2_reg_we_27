import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/databases/tableBookingDB/tableBookingDatabase.dart';
import 'package:machan_eats_application/validators/validator.dart';
import '../../custom_form_field.dart';

class AddTableBookingForm extends StatefulWidget {
  final FocusNode purposeFocusNode;
  final FocusNode branchFocusNode;
  final FocusNode tableSizeFocusNode;
  final FocusNode decorationThemeFocusNode;
  final FocusNode dateFocusNode;
  final FocusNode timeFocusNode;

  const AddTableBookingForm({
    required this.purposeFocusNode,
    required this.branchFocusNode,
    required this.tableSizeFocusNode,
    required this.decorationThemeFocusNode,
    required this.dateFocusNode,
    required this.timeFocusNode,
  });

  // DateTime _dateTime;

  @override
  _AddTableBookingFormState createState() => _AddTableBookingFormState();
}

class _AddTableBookingFormState extends State<AddTableBookingForm> {
  final _addTableBookingFormKey = GlobalKey<FormState>();

  final List<String> branches = ['Diyawannawa','Kadawatha','Kaduwela','Panadura','Yatinuwara'];

  bool _isProcessing = false;

  final TextEditingController _purposeController = TextEditingController();
  // final TextEditingController _branchController = TextEditingController();
  final TextEditingController _tableSizeController = TextEditingController();
  final TextEditingController _decorationThemeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String getPurpose = "";
  String getBranch = "";
  String getTableSize = "";
  String getDecorationTheme = "";
  String getDate = "";
  String getTime = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _addTableBookingFormKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8.0,bottom: 24.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:24.0),
                    Text(
                      'Create Table Booking',
                      style: TextStyle(
                        fontSize: 24.0,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:24.0),
                    Text(
                      'Purpose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _purposeController,
                      focusNode: widget.purposeFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getPurpose = value;
                      },
                      label: 'Purpose',
                      hint: 'Write your purpose',
                    ),
                    SizedBox(height:24.0),
                    Text(
                      'Branch',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    DropdownButtonFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(
                            color: Colors.white
                        ),
                        errorStyle: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                              width: 2,
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.amber,
                            )
                        ),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                            color: Colors.redAccent,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() => getBranch = value.toString());
                      },
                      value: getBranch.isEmpty ? 'Diyawannawa' : getBranch,
                      validator: (value) {
                            if(value == null || value.toString().isEmpty){
                              return 'This source can not be empty.';
                            }
                            getBranch = value.toString();
                      },
                      items: branches.map((branch) {
                        return DropdownMenuItem(
                          child: Text(branch),
                          value: branch,
                        );
                      }).toList(),
                      // selectedItemBuilder: (context) {
                      //   return [Text(getBranch)];
                      // },
                    ),
                    SizedBox(height:24.0),
                    Text(
                      'Table Size',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _tableSizeController,
                      focusNode: widget.tableSizeFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getTableSize = value;
                      },
                      label: 'Table Size',
                      hint: 'Write your table size',
                    ),
                    SizedBox(height:24.0),
                    Text(
                      'Decoration Theme',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    CustomFormField(
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _decorationThemeController,
                      focusNode: widget.decorationThemeFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        getDecorationTheme = value;
                      },
                      label: 'Decoration Theme',
                      hint: 'Write your decoration theme',
                    ),

                    SizedBox(height:24.0),
                    Text(
                      'Booking Date and Time',
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:24.0),

                    SizedBox(
                      height: 90.0,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child:
                                Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 1,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height:8.0),
                                  Expanded(
                                    child:
                                  CustomFormField(
                                    initialValue: "",
                                    isLabelEnabled: false,
                                    controller: _dateController,
                                    focusNode: widget.dateFocusNode,
                                    keyboardType: TextInputType.text,
                                    inputAction: TextInputAction.next,
                                    validator: (value) {
                                      Validator.validateField(
                                          value: value
                                      );
                                      getDate = value;
                                    },
                                    label: 'Date',
                                    hint: 'Write your date',
                                  ),
                                  ),
                                ],
                              ),
                                ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child:
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Time',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      letterSpacing: 1,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height:8.0),
                                  Expanded(
                                    child:
                                  CustomFormField(
                                    initialValue: "",
                                    isLabelEnabled: false,
                                    controller: _timeController,
                                    focusNode: widget.timeFocusNode,
                                    keyboardType: TextInputType.text,
                                    inputAction: TextInputAction.next,
                                    validator: (value) {
                                      Validator.validateField(
                                          value: value
                                      );
                                      getTime = value;
                                    },
                                    label: 'Time',
                                    hint: 'Write your time',
                                  ),
                                  ),
                                ],
                              ),
                                ),
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   _dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()
                    // ),

                  ],
                )
            ),
            _isProcessing
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
            ) : Container(
              margin: EdgeInsets.only(left: 10),
              // width: double.maxFinite,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                  onPressed: () async{
                    widget.branchFocusNode.unfocus();
                    widget.tableSizeFocusNode.unfocus();
                    widget.decorationThemeFocusNode.unfocus();
                    widget.dateFocusNode.unfocus();
                    widget.timeFocusNode.unfocus();

                    if(_addTableBookingFormKey.currentState!.validate()){
                      setState(() {
                        _isProcessing = true;
                      });

                      await TableBookingDatabase.addTableBooking(purpose: getPurpose, branch: getBranch, tableSize: getTableSize, decorationTheme: getDecorationTheme, date: getDate, time: getTime);

                      setState(() {
                        _isProcessing = false;
                      });
                      Navigator.of(context).pop();
                    }

                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: Text(
                          'Book Table',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 2,
                          )
                      )
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