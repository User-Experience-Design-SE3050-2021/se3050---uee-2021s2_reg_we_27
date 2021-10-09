import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';



class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {

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
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0),
                  child: Text(
                    'Food Ordering',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 1,),
    );
  }
}
