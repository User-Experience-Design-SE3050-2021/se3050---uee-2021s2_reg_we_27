import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/models/category.dart';
import 'package:machan_eats_application/scr/screens/commons.dart';

import 'custom_text.dart';

List<Category> categoriesList = [
  Category(name: "Beverages", image: "beer.jpg"),
  Category(name: "Bites", image: "chiken.jpg"),
  Category(name: "Main", image: "kothth.jpg"),
  Category(name: "Desserts", image: "mock.jpg"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "images/${categoriesList[index].image}",
                          width: 80,
                          height: 80,
                        )),
                  ),
                ),
                CustomText(
                  text: "${categoriesList[index].name}",
                  size: 14,
                  color: white,
                  weight: FontWeight.bold,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
