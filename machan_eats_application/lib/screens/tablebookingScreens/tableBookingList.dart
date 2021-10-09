import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/databases/tableBookingDB/tableBookingDatabase.dart';
import 'package:machan_eats_application/screens/tablebookingScreens/editTableBookingScreen.dart';

class TableBookingList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: TableBookingDatabase.retrieveTableBooking(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          return Text('Something went wrong');
        }
        else if(snapshot.hasData || snapshot.data != null){
          return ListView.separated(
            padding: EdgeInsets.only(top: 16.0),
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index){
              var noteInfo = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String docID = snapshot.data!.docs[index].id;
              String purpose = noteInfo['purpose'];
              String branch = noteInfo['branch'];
              String tableSize = noteInfo['tableSize'];
              String decorationTheme = noteInfo['decorationTheme'];
              String date = noteInfo['date'];
              String time = noteInfo['time'];
              print("AB"+purpose);

              return Ink(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  trailing:Icon(
                      Icons.edit,
                      color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditTableBookingScreen(
                        currentPurpose: purpose,
                        currentBranch: branch,
                        currentTableSize: tableSize,
                        currentDecorationTheme: decorationTheme,
                        currentDate: date,
                        currentTime: time,
                        documentId: docID,
                      ),
                    ),
                  ),
                  title: Text(
                    purpose,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    ('$branch Branch'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          ),
        );

      },
    );
  }
}