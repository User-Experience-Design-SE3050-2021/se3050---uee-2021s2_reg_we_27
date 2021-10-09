import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/models/products.dart';
import 'add_delivery.dart';
import 'app_bar.dart';
import 'bottom_nav.dart';
import 'commons.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {

  Product product = Product(
      name: "Bites",
      price: 320.00,
      rating: 4.2,
      description: "Crispy Chiken",
      wishList: true,
      image: "chiken.jpg");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: black),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.amber,
          elevation: 0,
          centerTitle: true,
          title: AppBarTitle(
            sectionName: 'App',
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8),
            ),
          ],
        ),
        backgroundColor: black,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 120,
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(color: black, offset: Offset(2, 0), blurRadius: 5)
                ]),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "images/${product.image}",
                      height: 120,
                      width: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: product.name + "\n",
                                style: TextStyle(color: black, fontSize: 20)),
                            TextSpan(
                                text: "\R\s" + product.price.toString() + "\n",
                                style: TextStyle(
                                    color: black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold)),
                          ]),
                        ),
                        SizedBox(
                          width: 150,
                        ),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.delete,
                              color: black,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Padding(
              padding: EdgeInsets.only(left: 200.0, right: 20.0),
              child: Container(
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Order Confirmed!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddDelivery(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 16,
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
        bottomNavigationBar: BottomNavBar(
          selectedIndex: 1,
        ));
  }
}
