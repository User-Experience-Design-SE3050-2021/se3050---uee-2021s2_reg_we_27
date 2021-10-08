// import 'package:fluttertoast/fluttertoast.dart';
import 'package:machan_eats_application/databases/tableBookingDB/tableBookingDatabase.dart';
import 'package:machan_eats_application/validators/validator.dart';
import 'package:flutter/material.dart';
import '../../custom_form_field.dart';

class EditTableBookingForm extends StatefulWidget {
  final String documentId;
  final String currentPurpose;
  final String currentBranch;
  final String currentTableSize;
  final String currentDecorationTheme;
  final String currentDate;
  final String currentTime;


  final FocusNode purposeFocusNode;
  final FocusNode branchFocusNode;
  final FocusNode tableSizeFocusNode;
  final FocusNode decorationThemeFocusNode;
  final FocusNode dateFocusNode;
  final FocusNode timeFocusNode;

  const EditTableBookingForm({
    required this.documentId,
    required this.currentPurpose,
    required this.currentBranch,
    required this.currentTableSize,
    required this.currentDecorationTheme,
    required this.currentDate,
    required this.currentTime,

    required this.purposeFocusNode,
    required this.branchFocusNode,
    required this.tableSizeFocusNode,
    required this.decorationThemeFocusNode,
    required this.dateFocusNode,
    required this.timeFocusNode,

  });

  @override
  _EditTableBookingFormState createState() => _EditTableBookingFormState();
}

class _EditTableBookingFormState extends State<EditTableBookingForm> {
  final _editTableBookingFormKey = GlobalKey<FormState>();

  final List<String> decorationThemes = [
    'Simple',
    'Family',
    'Birthday',
    'Candles',
    'Romantic'
  ];
  final List<String> tableSizes = ['2','4','8','12'];

  bool _isProcessing = false;

  final TextEditingController _purposeController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  // final TextEditingController _tableSizeController = TextEditingController();

  // final TextEditingController _decorationThemeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  String updatePurpose = "";
  String updateBranch = "";
  String updateTableSize = "";
  String updateDecorationTheme = "";
  String updateDate = "";
  String updateTime = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _editTableBookingFormKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 24.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.0),
                    Text(
                      'Edit Table Booking',
                      style: TextStyle(
                        fontSize: 24.0,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Purpose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      isEnabled: true,
                      initialValue: widget.currentPurpose,
                      isLabelEnabled: false,
                      controller: _purposeController,
                      focusNode: widget.purposeFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        updatePurpose = value;
                      },
                      label: 'Purpose',
                      hint: 'Write your purpose',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Branch',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    CustomFormField(
                      isEnabled: false,
                      initialValue: widget.currentBranch,
                      isLabelEnabled: false,
                      controller: _branchController,
                      focusNode: widget.branchFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        Validator.validateField(
                            value: value
                        );
                        updateBranch = value;
                      },
                      label: 'Branch',
                      hint: 'Write your branch',
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Table Size',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    DropdownButtonFormField( //Table size dropdown
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
                        setState(() =>
                        updateTableSize = value.toString());
                      },
                      value: widget.currentTableSize,
                      validator: (value) {
                        if (value == null || value
                            .toString()
                            .isEmpty) {
                          return 'This source can not be empty.';
                        }
                        updateTableSize = value.toString();
                      },
                      items: tableSizes.map((tableSize) {
                        return DropdownMenuItem(
                          child: Text('For $tableSize Persons'),
                          value: tableSize,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Decoration Theme',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    DropdownButtonFormField( //decoration theme dropdown
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
                        setState(() =>
                        updateDecorationTheme = value.toString());
                      },
                      value: widget.currentDecorationTheme,
                      validator: (value) {
                        if (value == null || value
                            .toString()
                            .isEmpty) {
                          return 'This source can not be empty.';
                        }
                        updateDecorationTheme = value.toString();
                      },
                      items: decorationThemes.map((decorationThemes) {
                        return DropdownMenuItem(
                          child: Text('$decorationThemes Theme'),
                          value: decorationThemes,
                        );
                      }).toList(),
                    ),

                    SizedBox(height: 24.0),
                    Text(
                      'Booking Date and Time',
                      style: TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.0),

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
                                  SizedBox(height: 8.0),
                                  Expanded(
                                    child:
                                    CustomFormField(
                                      isEnabled: false,
                                      initialValue: widget.currentDate,
                                      isLabelEnabled: false,
                                      controller: _dateController,
                                      focusNode: widget.dateFocusNode,
                                      keyboardType: TextInputType.text,
                                      inputAction: TextInputAction.next,
                                      validator: (value) {
                                        Validator.validateField(
                                            value: value
                                        );
                                        updateDate = value;
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
                                  SizedBox(height: 8.0),
                                  Expanded(
                                    child:
                                    CustomFormField(
                                      isEnabled: false,
                                      initialValue: widget.currentTime,
                                      isLabelEnabled: false,
                                      controller: _timeController,
                                      focusNode: widget.timeFocusNode,
                                      keyboardType: TextInputType.text,
                                      inputAction: TextInputAction.next,
                                      validator: (value) {
                                        Validator.validateField(
                                            value: value
                                        );
                                        updateTime = value;
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
                  onPressed: () async {
                    widget.branchFocusNode.unfocus();
                    widget.tableSizeFocusNode.unfocus();
                    widget.decorationThemeFocusNode.unfocus();
                    widget.dateFocusNode.unfocus();
                    widget.timeFocusNode.unfocus();

                    if (_editTableBookingFormKey.currentState!.validate()) {
                      setState(() {
                        _isProcessing = true;
                      });

                      await TableBookingDatabase.updateTableBooking(
                          docId: widget.documentId,
                          purpose: updatePurpose,
                          branch: updateBranch,
                          tableSize: updateTableSize,
                          decorationTheme: updateDecorationTheme,
                          date: updateDate,
                          time: updateTime);

                      setState(() {
                        _isProcessing = false;
                      });

                      // Fluttertoast.showToast(       //Toast Message
                      //   msg: "Table Booking Details Updated Successfully",
                      //   fontSize:16,
                      //   backgroundColor: Colors.lightGreenAccent,
                      //   textColor: Colors.black,
                      // );

                      Navigator.of(context).pop();
                    }
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: Text(
                          'Update',
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