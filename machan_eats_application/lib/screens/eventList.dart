import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/screens/CardView.dart';
import 'package:machan_eats_application/validators/database.dart';

import 'bottom_nav.dart';

class EventList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0, top: 5.0),
          child: Text(
            'Machan Eats',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
      ),

      body:StreamBuilder<QuerySnapshot>(
      stream: Database.readEvents(),
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
              String title = noteInfo['title'];
              String description = noteInfo['description'];
              // String noOfInvitees = noteInfo['noOfInvitees'];
              // String date = noteInfo['date'];
              // String startingTime = noteInfo['startingTime'];
              // String closingTime = noteInfo['closingTime'];

              return Ink(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),

                child: ListView(
                  shrinkWrap: true,
                  children:[

                Padding(
                padding: EdgeInsets.only(left: 20.0, top: 5.0),
                child:Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
              Padding(
              padding: EdgeInsets.only(left: 20.0, top: 5.0),
              child:Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                    ),
              ),
              Padding(
              padding: EdgeInsets.only(left: 20.0, top: 5.0,right: 10.0),
              child:ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CardView()));
                      },


                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0,bottom: 16.0,right: 3.0),
                        child: Text(
                          'Pay',
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
                    ],
                ),
                    SizedBox(height: 8.0),
                  ],
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(8.0),
                  // ),
                  // onTap: (){},
                  // title: Text(
                  //   title,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     fontSize: 18.0,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //     letterSpacing: 1,
                  //   ),
                  // ),
                  // subtitle: Text(
                  //   description,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     fontSize: 15.0,
                  //     fontWeight: FontWeight.normal,
                  //     color: Colors.black,
                  //     letterSpacing: 1,
                  //   ),
                  // ),
                  // subtitle1: Text(
                  //   noOfInvitees,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // subtitle: Text(
                  //   date,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // subtitle: Text(
                  //   startingTime,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  // subtitle: Text(
                  //   closingTime,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          ),
        );
      },
    ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 1,
        ));
  }
}
