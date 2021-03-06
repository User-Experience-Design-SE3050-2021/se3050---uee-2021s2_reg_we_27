import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/scr/models/products.dart';
import 'package:machan_eats_application/scr/widgets/custom_text.dart';
import 'app_bar.dart';
import 'bag.dart';
import 'commons.dart';

class Details extends StatefulWidget {
  final Product? product;

  Details({required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _itemCount = 0;

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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          child:
                              Image.asset("images/${widget.product!.image}")),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ],
                      ),
                      Positioned(
                        right: 20,
                        bottom: 40,
                        child: Container(
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: grey,
                                    offset: Offset(2, 1),
                                    blurRadius: 3)
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Icon(
                              Icons.favorite,
                              size: 22,
                              color: red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                CustomText(
                    text: widget.product!.name,
                    size: 26,
                    color: white,
                    weight: FontWeight.bold),
                CustomText(
                    text: "\R\s" +
                        widget.product!.price!.toStringAsFixed(2) * _itemCount,
                    size: 20,
                    color: white,
                    weight: FontWeight.w600),

                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: amber,
                            size: 36,
                          ),
                          onPressed: () => setState(() => _itemCount--)),

                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(28, 12, 28, 12),
                        child: new Text(
                          _itemCount.toString(),
                          style: TextStyle(
                              color: black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: amber,
                            size: 36,
                          ),
                          onPressed: () => setState(() => _itemCount++)),
                    ),
                  ],
                ),

                Divider(
                  height: 15,
                ),
                CustomText(
                    text: widget.product!.description,
                    size: 17,
                    color: white,
                    weight: FontWeight.normal),
                SizedBox(
                  height: 40,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 14),
                  child: Container(
                    height: 40,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text('Added to cart Successfully!'),
                          action: SnackBarAction(
                            label: 'Continue',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ShoppingBag(),
                                ),
                              );

                            },
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 00.0, bottom: 00.0),
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1,
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
