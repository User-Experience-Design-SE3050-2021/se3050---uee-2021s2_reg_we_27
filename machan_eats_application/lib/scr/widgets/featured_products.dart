import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/helpers/screen_navigation.dart';
import 'package:machan_eats_application/scr/models/products.dart';
import 'package:machan_eats_application/scr/screens/commons.dart';
import 'package:machan_eats_application/scr/screens/details.dart';


import 'custom_text.dart';

List<Product> productsList = [
  Product(name: "Burger", price: 300.00, rating: 4.2, description: "Chicken Burger loaded cheese with greavy", wishList: true, image: "burger.jpg"),
  Product(name: "Bites", price: 320.00, rating: 4.2, description: "Crispy Chiken with hot sause and cheese dip", wishList: true, image: "chiken.jpg"),
  Product(name: "Sea Food", price: 450.00, rating: 4.0, description: "Tasty sea food dishes", wishList: true, image: "sea_food.jpg"),
  Product(name: "Beer", price: 300.00, rating: 4.0, description: "Range of Beers", wishList: true, image: "beer.jpg"),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12,14,16,12),
              child: GestureDetector(
                onTap: (){
                  changeScreen(_, Details(product: productsList[index],));
                },
                child: Container(
                  height: 140,
                  width: 180,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: black,
                          offset: Offset(0, 0),
                          blurRadius: 0)
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${productsList[index].image}",
                        height: 120,
                        width: 170,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: productsList[index].name,
                              color: black,
                              weight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: grey,
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: productsList[index].wishList ? Icon(
                                  Icons.favorite,
                                  color: red,
                                  size: 18,
                                ) : Icon(
                                Icons.favorite_border,
                                color: red,
                                size: 18,
                              ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(
                                  text: productsList[index].rating.toString(),
                                  color: grey,
                                  size: 14,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.star,
                                color: amber,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: amber,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: amber,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: amber,
                                size: 16,
                              ),
                              Icon(
                                Icons.star,
                                color: grey,
                                size: 16,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(text: "\R\S${productsList[index].price}", weight: FontWeight.bold,),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

