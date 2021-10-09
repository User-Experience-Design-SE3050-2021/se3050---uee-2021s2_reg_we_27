import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/helpers/screen_navigation.dart';
import 'package:machan_eats_application/scr/widgets/custom_text.dart';
import 'app_bar.dart';
import 'bottom_nav.dart';
import 'commons.dart';
import 'foodorder_main.dart';

class Restaurants extends StatefulWidget {
  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          title: AppBarTitle(
            sectionName: 'App',
          ),
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Divider(),
              CustomText(
                text: "Machang Restaurants",
                color: white,
                size: 20,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, FoodOrderMain());
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 00.00, left: 00.00),
                      child: Image.asset(
                        "images/kanda.PNG",
                        width: 360,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: grey,
                child: Text(
                  '\n Machang Kandana\n 011-2243476\n No.127,Station Road,Kandana\n ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, FoodOrderMain());
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 00.00, left: 00.00),
                      child: Image.asset(
                        "images/man.PNG",
                        width: 360,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: grey,
                child: Text(
                  '\n Machang Kadawatha\n 011-2927379\n No.304,Kandy Road,Kadawatha\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, FoodOrderMain());
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 00.00, left: 00.00),
                      child: Image.asset(
                        "images/jaela.jpeg",
                        width: 360,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: grey,
                child: Text(
                  '\n Machang Ja-Ela\n 077-2135400\n 300A. Vije Road, Ja-ela\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, FoodOrderMain());
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 00.00, left: 00.00),
                      child: Image.asset(
                        "images/athurugiriya.jpeg",
                        width: 360,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: grey,
                child: Text(
                  '\n Machang Athurugiriya\n 011-5969666\n Athurugiriya\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  changeScreen(context, FoodOrderMain());
                },
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 00.00, left: 00.00),
                      child: Image.asset(
                        "images/negambo.jpeg",
                        width: 360,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: grey,
                child: Text(
                  '\n Machang Negambo\n 031-2228400\n 21, Minuwangoda Road,Negambo\n',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
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
