import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/screens/CardDetailsScreen.dart';

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
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

      body: SafeArea(

        child: ListView(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.only(left: 30.0, top: 30.0, right: 80.0),
              child: Text(
                'Payment',
                style: TextStyle(
                  color: Colors.white,
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
                        builder: (context) => CardDetailsScreen(),
                      ),
                    );
                  },
                  child:
                  Padding(
                    padding: const EdgeInsets.only(left:30.0,right: 10.0,top: 5.0),
                    child: Image.asset(
                      "assets/visa.jpg",
                      width: 350,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0),
              child:Container(
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '                       Visa Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CardDetailsScreen(),
                      ),
                    );
                  },
                  child:
                Padding(
                  padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 5.0),
                  child: Image.asset(
                    "assets/mastercard.jpg",
                    width: 390,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
    ),
              ],

            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10.0,bottom: 30.0),
              child:Container(
                height: 40,
                color: Colors.black,
                child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      '    Master Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
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

