import 'package:flutter/material.dart';
import 'package:machan_eats_application/screens/Venues.dart';
import 'bottom_nav.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({Key? key}) : super(key: key);

  @override
  _RestaurantsViewState createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
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
                'Restaurants',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
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
                        builder: (context) => Venues(),
                      ),
                    );
                  },
                  child:

                Padding(
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/kaduwela.jpeg",
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kaduwela',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    011-2489992',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    No.27,New Kandy Road,Battaramulla',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/kandana.jpeg",
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kandana',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    011-2243476',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    No.127,Station Road,Kandana',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/negombo.jpeg",
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Kandana',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    031-2228400',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    No.21,Minuwangoda Road,Negombo',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                  padding: const EdgeInsets.only(left:2.0,right: 1.0,top: 5.0),
                  child: Image.asset(
                    "assets/jaela.jpeg",
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    Machang Ja Ela',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    011-213 5400',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
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
                color: Colors.amber,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '    No.300A,Vije Road Thudalla,Ja ela',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
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

