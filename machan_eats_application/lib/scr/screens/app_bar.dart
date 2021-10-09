// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String sectionName;
  const AppBarTitle({
    Key?key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //Image.asset('images/logo.jpg',height: 20),
        SizedBox(width: 0,),
        Text(
          'Matchan Eats',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text(
          ' $sectionName ',
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
