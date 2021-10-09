
import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/widgets/categories.dart';
import 'package:machan_eats_application/scr/widgets/custom_text.dart';
import 'package:machan_eats_application/scr/widgets/featured_products.dart';
import 'package:machan_eats_application/scr/widgets/popular_food.dart';

import 'commons.dart';

class FoodOrderMain extends StatefulWidget {
  @override
  _FoodOrderMainState createState() => _FoodOrderMainState();
}

class _FoodOrderMainState extends State<FoodOrderMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        backgroundColor: amber,
        title: CustomText(text: "Matchan Eats",),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.notifications_none, color: white,)),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: black,
      body: SafeArea(
        child: ListView(
          children: <Widget>[

            SizedBox(
              height: 5,
            ),
            Container(
              color: amber,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                    // boxShadow: [
                    //   BoxShadow(color: grey, offset: Offset(1, 1), blurRadius: 4)
                    // ],
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: red,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: "Find food and restaurant",
                          border: InputBorder.none),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: red,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            // Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                  text: "Featured",
                  size: 20,
                  color: white),
            ),

            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                  text: "Popular",
                  size: 20,
                  color: white),
            ),
            PopularFood(),
            Divider(),

          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   color: white,
      //   child: Row(
      //     children: <Widget>[
      //       Image.asset("images/home.png")
      //     ],
      //   ),
      // ),
    );
  }
}
