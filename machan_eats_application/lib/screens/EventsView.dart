import 'package:flutter/material.dart';
import 'package:machan_eats_application/screens/Restaurants.dart';
import 'package:machan_eats_application/screens/eventList.dart';

import 'bottom_nav.dart';


class EventsView extends StatefulWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  _EventsViewState createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              builder: (context) => RestaurantsView(),
            ),
          );
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size:32,
        ),
      ),
      body: SafeArea(

        child: ListView(
          children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 30.0, right: 80.0),
              child: Text(
                'All Events',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 30.0,),
            child:
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EventList(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'My Events',
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
            ],
),
            TextField(
            ),
            Row(

              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RestaurantsView(),
                      ),
                    );
                  },
                  child:
                Padding(
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/event1.jpeg",
                    width: 408,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                ),

              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '   Monthly gathering',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kandana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    22 Sep 2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    02:00 PM - 06:00 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            TextField(
            ),
            Row(

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:2.0,right: 1.0),
                  child: Image.asset(
                    "assets/event2.jpeg",
                    width: 408,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '   DJ concert',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kandana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    22 Sep 2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    04:00 PM - 06:00 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            TextField(
            ),
            Row(

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/event3.jpeg",
                    width: 408,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '   Wedding',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kandana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    12 Oct 2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    02:00 PM - 05:00 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            TextField(
            ),
            Row(

              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/event4.jpeg",
                    width: 408,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),

              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '   Annual conference',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kandana',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    30 Nov 2021',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:2.0,right: 1.0, bottom: 20.0),
              child:Container(
                width: 428,
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    06:00 PM - 10:00 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),


     bottomNavigationBar: BottomNavBar(
      selectedIndex: 1,
    ));
  }
}

