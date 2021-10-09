import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/scr/screens/restaurant.dart';
import 'package:machan_eats_application/screens/EventsView.dart';
import 'package:machan_eats_application/screens/tablebookingScreens/tableBookingdetails.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListView(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Flexible(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset('assets/logo.jpg',height:70,)
                    ),
                  ),
                  const Flexible(
                    flex: 3,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 0.0),
                        child: Text(
                          'Machan Eats',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Restaurants(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(left: 8.0),
                    color: Colors.amber,
                    height: 150.0,
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Food Ordering',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 27,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.contain, // otherwise the logo will be tiny
                            child: Image.asset(
                              'assets/food_home.png',
                              height: 50,
                              width: 70,
                              // fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TableBookingScreen(),
                  ),
                );
              },
              child:
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(right: 8.0),
                  color: Colors.amber,
                  height: 150.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.contain, // otherwise the logo will be tiny
                          child: Image.asset(
                            'assets/table_home.png',
                            height: 50,
                            width: 70,
                            // fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Table Booking',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventsView(),
              ),
            );
          },
          child:
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(left: 5.0),
                  color: Colors.amber,
                  height: 150.0,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Event Planning',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 26,
                          ),
                        ),
                      ),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.contain, // otherwise the logo will be tiny
                          child: Image.asset(
                            'assets/event_home.png',
                            height: 45,
                            width: 60,
                            // fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
            ],
          ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1,),
    );
  }
}
