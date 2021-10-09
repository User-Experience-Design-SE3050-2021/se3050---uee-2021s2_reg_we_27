import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:machan_eats_application/custom_form_field.dart';
import 'package:machan_eats_application/screens/eventList.dart';
import 'package:machan_eats_application/validators/database.dart';
import 'package:machan_eats_application/validators/validator.dart';



class AddEventForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  final FocusNode noOfInvitesFocusNode;
  final FocusNode dateFocusNode;
  final FocusNode startingTimeFocusNode;
  final FocusNode closingTimeFocusNode;


  const AddEventForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
    required this.noOfInvitesFocusNode,
    required this.dateFocusNode,
    required this.startingTimeFocusNode,
    required this.closingTimeFocusNode,
  });

  @override
  _AddEventFormState createState() => _AddEventFormState();
}

class _AddEventFormState extends State<AddEventForm> {
  final _addEventFormKey = GlobalKey<FormState>();
  final dateFormat = DateFormat("yyyy-MM-dd");
  final startingTimeFormat = DateFormat("hh:mm a");
  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _noOfInvitesController = TextEditingController();
  // final TextEditingController _dateController = TextEditingController();
  // final TextEditingController _startingTimeController = TextEditingController();
  // final TextEditingController _closingTimeController = TextEditingController();

  String getTitle = "";
  String getDescription = "";
  String getNoOfInvitees = "";
  String getDate = "";
  String getStartingTime = "";
  String getClosingTime = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
     child: Form(
      key: _addEventFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 24.0,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 25.0, right: 80.0,bottom: 10.0),
                    child: Text(
                      'Create New Event',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Title',
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
                     controller: _titleController,
                     focusNode:widget.titleFocusNode,
                     keyboardType:TextInputType.text,
                     inputAction:TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter title';
                      }
                      // return null;
                      getTitle = value;
                    },
                     label: 'Title',
                     hint: 'Enter your title',
                  ),

                  SizedBox(height: 24.0),
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomFormField(
                    maxLines: 3,
                    isLabelEnabled:false,
                    controller: _descriptionController,
                    focusNode:widget.descriptionFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Description';
                      }
                      // return null;
                      getDescription = value;
                    },
                    label: 'Description',
                    hint: 'Enter your Description',
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'No Of Invitees',
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
                    controller: _noOfInvitesController,
                    focusNode:widget.noOfInvitesFocusNode,
                    keyboardType:TextInputType.text,
                    inputAction:TextInputAction.next,
                    // validator: (value) {
                    //   Validator.validateField(
                    //       value: value
                    //   );
                    //   getNoOfInvitees = value;
                    // },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter no of invitees';
                      }
                      // return null;
                      getNoOfInvitees = value;

                    },
                    label: 'No Of Invitees',
                    hint: 'Enter No Of Invitees',
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
                            fontSize: 20.0,
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Expanded(
                          child:
                          DateTimeField(                    //date form
                            format: dateFormat,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            // dropdownColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
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
      ],
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
                  'Starting Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child:
                  DateTimeField(
                    format: startingTimeFormat,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    // dropdownColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: const Icon(Icons.access_time),
                      isDense: true,
                      hintText: "hh:mm a",
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
                        getStartingTime =
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
                //  SizedBox(height: 24.0),
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
                  'Closing Time',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Expanded(
                  child:
                  DateTimeField(
                    format: startingTimeFormat,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    // dropdownColor: Colors.black,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.amberAccent),
                      suffixIcon: const Icon(Icons.access_time),
                      isDense: true,
                      hintText: "hh:mm a",
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
                        getClosingTime =
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
                  // SizedBox(height: 24.0),

          ],
        ),
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
                        widget.titleFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();
                        widget.noOfInvitesFocusNode.unfocus();
                        widget.dateFocusNode.unfocus();
                        widget.startingTimeFocusNode.unfocus();
                        widget.closingTimeFocusNode.unfocus();

                        if(_addEventFormKey.currentState!.validate()){
                          setState(() {
                            _isProcessing = true;
                          });

                          await Database.addEvent(title: getTitle, description: getDescription, noOfInvites: getNoOfInvitees, date: getDate, startingTime: getStartingTime, closingTime: getClosingTime);
                          setState(() {
                            _isProcessing = false;
                          });

                        Fluttertoast.showToast(       //Toast Message
                        msg: "Event Details Added Successfully",
                        fontSize:16,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventList(),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0,bottom: 12.0),
                        child: Text(
                          'Add New Event',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                 ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
            ),
    );
  }
}
