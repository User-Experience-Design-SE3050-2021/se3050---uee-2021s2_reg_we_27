import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:machan_eats_application/databases/tableBookingDB/tableBookingDatabase.dart';
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

  @override
  _AddTableBookingFormState createState() => _AddTableBookingFormState();
}

class _AddTableBookingFormState extends State<AddTableBookingForm> {
  final _addTableBookingFormKey = GlobalKey<FormState>();

  final List<String> branches = ['Diyawannawa','Kadawatha','Kaduwela','Panadura','Yatinuwara'];
  final List<String> tableSizes = ['2','4','8','12'];
  final List<String> decorationThemes = ['Simple','Family','Birthday','Candles','Romantic'];
  final dateFormat = DateFormat("yyyy-MM-dd");
  final timeFormat = DateFormat("hh:mm a");

  bool _isProcessing = false;
  final TextEditingController _purposeController = TextEditingController();

  String getPurpose = "";
  String getBranch="";
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
                    Text(                                     //purpose Label
                      'Purpose',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    CustomFormField(                                    //purpose input field
                      isEnabled: true,
                      initialValue: "",
                      isLabelEnabled: false,
                      controller: _purposeController,
                      focusNode: widget.purposeFocusNode,
                      keyboardType: TextInputType.text,
                      inputAction: TextInputAction.next,
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Purpose cannot be empty.';
                        }
                        getPurpose = value;
                      },
                      label: 'Purpose',
                      hint: 'Write your purpose',
                    ),
                    SizedBox(height:24.0),
                    Text(                                     //branch Label
                      'Branch',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    DropdownButtonFormField(                                       //branch dropdown
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Select a branch',
                        fillColor: Colors.black,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(
                            color: Colors.grey
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
                      // value: getBranch.isEmpty ? 'Diyawannawa' : getBranch,
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
                    ),
                    SizedBox(height:24.0),
                    Text(                                       //table size label
                      'Table Size',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    DropdownButtonFormField(                                       //table size dropdown
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Select a table size',
                        fillColor: Colors.black,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(
                            color: Colors.grey
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
                        setState(() => getTableSize = value.toString());
                      },
                      // value: getTableSize.isEmpty ? '2' : getTableSize,
                      validator: (value) {
                        if(value == null || value.toString().isEmpty){
                          return 'This source can not be empty.';
                        }
                        getTableSize = value.toString();
                      },
                      items: tableSizes.map((tableSize) {
                        return DropdownMenuItem(
                          child: Text('For $tableSize Persons'),
                          value: tableSize,
                        );
                      }).toList(),
                    ),
                    SizedBox(height:24.0),
                    Text(                                     //decoration Label
                      'Decoration Theme',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        letterSpacing: 1,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height:8.0),
                    DropdownButtonFormField(                                       //decoration theme dropdown
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      dropdownColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Select a decoration theme',
                        fillColor: Colors.black,
                        filled: true,
                        labelStyle: TextStyle(color: Colors.yellowAccent),
                        hintStyle: const TextStyle(
                            color: Colors.grey
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
                        setState(() => getDecorationTheme = value.toString());
                      },
                      // value: getDecorationTheme.isEmpty ? 'Simple' : getDecorationTheme,
                      validator: (value) {
                        if(value == null || value.toString().isEmpty){
                          return 'This source can not be empty.';
                        }
                        getDecorationTheme = value.toString();
                      },
                      items: decorationThemes.map((decorationThemes) {
                        return DropdownMenuItem(
                          child: Text('$decorationThemes Theme'),
                          value: decorationThemes,
                        );
                      }).toList(),
                    ),

                    SizedBox(height:24.0),
                    Text(                                     //Booking date and time Label
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
                                  Text(                                     //date Label
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
                                    DateTimeField(                    //date form
                                      format: dateFormat,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      // dropdownColor: Colors.black,
                                      decoration: InputDecoration(
                                        fillColor: Colors.black,
                                        filled: true,
                                        labelStyle: TextStyle(color: Colors.yellowAccent),
                                        suffixIcon: const Icon(Icons.calendar_today),
                                        isDense: true,
                                        hintText: "yyyy-MM-dd",
                                        hintStyle: const TextStyle(
                                            color: Colors.grey
                                        ),
                                        errorStyle: const TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: Colors.amber,
                                              width: 2,
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6.0),
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
                                          borderRadius: BorderRadius.circular(6.0),
                                          borderSide: const BorderSide(
                                            color: Colors.redAccent,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onShowPicker: (context, currentValue) {
                                        if(currentValue != null){
                                          var format1 = "${currentValue.day}-${currentValue.month}-${currentValue.year}";
                                          print(format1);
                                        }
                                        return showDatePicker(
                                            context: context,
                                            firstDate: DateTime(1900),
                                            initialDate: currentValue ?? DateTime.now(),
                                            lastDate: DateTime(2100));
                                      },
                                      onChanged: (currentValue) {
                                        if(currentValue != null) {
                                          setState(() =>
                                          getDate =
                                          "${currentValue.day}-${currentValue
                                              .month}-${currentValue.year}");
                                        }
                                      },
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
                                  Text(                                     //time Label
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
                                    DateTimeField(
                                      format: timeFormat,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      // dropdownColor: Colors.black,
                                      decoration: InputDecoration(
                                        fillColor: Colors.black,
                                        filled: true,
                                        labelStyle: TextStyle(color: Colors.yellowAccent),
                                        suffixIcon: const Icon(Icons.calendar_today),
                                        isDense: true,
                                        hintText: "hh:mm",
                                        hintStyle: const TextStyle(
                                            color: Colors.grey
                                        ),
                                        errorStyle: const TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6.0),
                                            borderSide: const BorderSide(
                                              color: Colors.amber,
                                              width: 2,
                                            )
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(6.0),
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
                                          borderRadius: BorderRadius.circular(6.0),
                                          borderSide: const BorderSide(
                                            color: Colors.redAccent,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onShowPicker: (context, currentValue) async {
                                        final TimeOfDay? time = await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                                        );
                                        return time == null ? null : DateTimeField.convert(time);
                                      },
                                      onChanged: (currentValue) {
                                        if(currentValue != null) {
                                          setState(() =>
                                          getTime =
                                          "${currentValue.hour}:${currentValue.minute} ");
                                        }
                                        // setState(() => getTime = currentValue.toString());
                                      },
                                    ),
                                  ),
                                ],
                              ),
                                ),
                          ),
                        ],
                      ),
                    ),

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

                      Fluttertoast.showToast(       //Toast Message
                        msg: "Table Booking Details Added Successfully",
                        fontSize:16,
                        backgroundColor: Colors.lightGreenAccent,
                        textColor: Colors.black,
                      );

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