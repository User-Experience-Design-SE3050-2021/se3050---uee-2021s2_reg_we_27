import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/helpers/screen_navigation.dart';
import 'package:machan_eats_application/scr/models/products.dart';
import 'package:machan_eats_application/scr/screens/commons.dart';
import 'package:machan_eats_application/scr/screens/details.dart';

List<Product> productsList = [
  Product(
      name: "Burger",
      price: 300.00,
      rating: 4.2,
      description: "Chicken koththu with spicy chiken greavy",
      wishList: true,
      image: "burger.jpg"),
  Product(
      name: "Bites",
      price: 320.00,
      rating: 4.2,
      description: "Crispy Chiken",
      wishList: true,
      image: "chiken.jpg"),
  Product(
      name: "Sea Food",
      price: 450.00,
      rating: 4.0,
      description: "Tasty sea food dishes",
      wishList: true,
      image: "sea_food.jpg"),
];

class PopularFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(2),
              child: GestureDetector(
                onTap: () {
                  changeScreen(
                      _,
                      Details(
                        product: productsList[index],
                      ));
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 5),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "images/${productsList[index].image}",
                              )),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            //height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                          child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 8, 10),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "${productsList[index].name}\n",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: white)),
                                TextSpan(
                                    text: "By:",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: white)),
                                TextSpan(
                                    text: "Matchan Eats",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: white)),
                              ], style: TextStyle(color: black))),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 15, 10),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "\R\S ${productsList[index].price}\n",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300,
                                        color: white)),
                              ], style: TextStyle(color: black))),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
