// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/scr/widgets/custom_text.dart';
import 'app_bar.dart';
import 'commons.dart';
import 'foodorder_main.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 8, 0, 30),
                  child: Text(
                    'Order Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 8, 0, 8),
                  child: CustomText(
                    text: "Order ID :                ORD001",
                    size: 20,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 8, 0, 8),
                  child: CustomText(
                    text: "Ordered Item :        Bites",
                    size: 20,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 8, 0, 8),
                  child: CustomText(
                    text: "Order Charge :        Rs.320.00",
                    size: 20,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 8, 0, 8),
                  child: CustomText(
                    text: "Delivery Charge:     Rs.100.00",
                    size: 20,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 8, 0, 8),
                  child: CustomText(
                    text: "Total Charge:           Rs.420.00",
                    size: 20,
                    color: white,
                    weight: FontWeight.bold,
                  ),
                ),
                Divider(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 30, 30),
                  child: Container(
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Order Confirmed!'),
                          action: SnackBarAction(
                            label: 'Finish',
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => FoodOrderMain(),
                                ),
                              );

                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text(
                          'Finish',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 1,
        ));
  }
}
