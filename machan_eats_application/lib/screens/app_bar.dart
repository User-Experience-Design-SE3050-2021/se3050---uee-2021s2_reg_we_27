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
        // Image.asset('assets/logo.jpg',height:30, width: 30,),
        SizedBox(width: 8),
        Text(
          'Machan Eats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
        ),
        Text(
          ' $sectionName ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
