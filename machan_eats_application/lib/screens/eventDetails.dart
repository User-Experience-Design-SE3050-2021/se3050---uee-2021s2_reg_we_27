import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/screens/addNewEventScreen.dart';
import 'package:machan_eats_application/screens/eventList.dart';

import 'addNewEventScreen.dart';

class EventsDetails extends StatefulWidget {
  const EventsDetails({Key? key}) : super(key: key);

  @override
  _EventsDetailsState createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
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
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddEventScreen(),
              ),
            );
          },
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0,bottom: 20,),
          child: EventList(),
        ),
      ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 1,
        ));

  }
}

