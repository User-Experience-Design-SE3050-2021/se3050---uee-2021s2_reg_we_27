import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:machan_eats_application/databases/tableBookingDB/tableBookingDatabase.dart';
// import 'package:machan_eats_application/screens/tablebookingScreens/tableBookingList.dart';
import '../app_bar.dart';
import 'editTableBookingForm.dart';


class EditTableBookingScreen extends StatefulWidget {
  final String currentPurpose;
  final String currentBranch;
  final String currentTableSize;
  final String currentDecorationTheme;
  final String currentDate;
  final String currentTime;
  final String documentId;

  EditTableBookingScreen({
    required this.currentPurpose,
    required this.currentBranch,
    required this.currentTableSize,
    required this.currentDecorationTheme,
    required this.currentDate,
    required this.currentTime,
    required this.documentId,
  });

  @override
  _EditTableBookingScreenState createState() => _EditTableBookingScreenState();
}

class _EditTableBookingScreenState extends State<EditTableBookingScreen> {
  final FocusNode _purposeFocusNode = FocusNode();
  final FocusNode _branchFocusNode = FocusNode();
  final FocusNode _tableSizeFocusNode = FocusNode();
  final FocusNode _decorationThemeFocusNode = FocusNode();
  final FocusNode _dateFocusNode = FocusNode();
  final FocusNode _timeFocusNode = FocusNode();

  bool _isDeleting = false;

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete ?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                // Text('Delete ?'),
                Text('Would you like delete table booking permanently?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              // onPressed: () => Navigator.pop(context, 'OK'),
              onPressed: () async {
                setState(() {
                  _isDeleting = true;
                });

                await TableBookingDatabase.deleteTableBooking(
                  docId: widget.documentId,
                );

                setState(() {
                  _isDeleting = false;
                });

                Fluttertoast.showToast(       //Toast Message
                  msg: "Table Booking Details Deleted Successfully",
                  fontSize:16,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                );

                Navigator.pop(context, 'OK');
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
          // backgroundColor: Colors.amber,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        _purposeFocusNode.unfocus();
        _branchFocusNode.unfocus();
        _tableSizeFocusNode.unfocus();
        _decorationThemeFocusNode.unfocus();
        _dateFocusNode.unfocus();
        _timeFocusNode.unfocus();
      },
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.amber,
            title: AppBarTitle(
              sectionName: '',
            ),
            actions: [
              _isDeleting
                  ? Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 16.0,),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.redAccent,
                  ),
                  strokeWidth: 3,
                ),
              ) : IconButton(
                  onPressed: () async {

                   await _showMyDialog(context);
                    // setState(() {
                    //   _isDeleting = true;
                    // });
                    //
                    // // await TableBookingDatabase.deleteTableBooking(
                    // //   docId: widget.documentId,
                    // // );
                    //
                    // _showMyDialog();
                    //
                    // setState(() {
                    //   _isDeleting = false;
                    // });
                    // Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.delete_forever, color: Colors.black, size: 32,)
              ),
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: EditTableBookingForm(
                documentId: widget.documentId,
                purposeFocusNode: _purposeFocusNode,
                branchFocusNode: _branchFocusNode,
                tableSizeFocusNode: _tableSizeFocusNode,
                decorationThemeFocusNode: _decorationThemeFocusNode,
                dateFocusNode: _dateFocusNode,
                timeFocusNode: _timeFocusNode,

                currentPurpose: widget.currentPurpose,
                currentBranch: widget.currentBranch,
                currentTableSize: widget.currentTableSize,
                currentDecorationTheme: widget.currentDecorationTheme,
                currentDate: widget.currentDate,
                currentTime: widget.currentTime,
              ),
            ),
          )
      ),
    );
  }
}