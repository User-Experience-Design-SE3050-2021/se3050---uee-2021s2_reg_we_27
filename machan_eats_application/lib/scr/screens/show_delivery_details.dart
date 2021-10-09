import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:machan_eats_application/scr/screens/view_delivery.dart';
import 'app_bar.dart';
import 'bottom_nav.dart';
import 'commons.dart';
import 'order.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({Key? key}) : super(key: key);

  @override
  _ShowDetailsState createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Order(),
              ),
            );
          },
          backgroundColor: Colors.orangeAccent,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 32,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            child: DeliveryList(),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 1,
        ));
  }
}
