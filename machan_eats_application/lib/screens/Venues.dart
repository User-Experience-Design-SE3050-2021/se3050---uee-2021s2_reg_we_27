import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/screens/addNewEventScreen.dart';

class Venues extends StatefulWidget {
  const Venues({Key? key}) : super(key: key);

  @override
  _VenuesState createState() => _VenuesState();
}

class _VenuesState extends State<Venues> {
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

      body: SafeArea(

        child: ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 30.0, right: 80.0),
              child: Text(
                'Venues',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
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
                        builder: (context) => AddEventScreen(),
                      ),
                    );
                  },
                  child:
                Padding(
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/venue3.jpg",
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
                    '    Arie Lagoon Banquet Hall',
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
                    '    Maximum no of guests - 800',
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
              height: 40,
              width: 428,
              color: Colors.black,
              child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '    Maximum pay - Rs. 6000/=',
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
                    "assets/venue2.jpg",
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
                      '    Pioneer Banquet',
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
                      '    Maximum no of guests - 600',
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Maximum pay - Rs. 5000/=',
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
                    "assets/venue4.jpg",
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Casper Homes Banquet',
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Maximum no of guests - 600',
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Maximum pay - Rs. 5500/=',
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
                    "assets/venue1.png",
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Aquamarine Banquet hall',
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Maximum no of guests - 500',
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
                height: 40,
                width: 428,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Maximum pay - Rs. 6500/=',
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

