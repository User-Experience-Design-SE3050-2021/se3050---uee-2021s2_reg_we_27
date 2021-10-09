import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/screens/restaurant.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;
  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.selectedIndex;
    });
  }

  final List<Widget> _children = [
    Restaurants(),

  ];
  void _onItemTapped() {

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _children[_selectedIndex]));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.arrow_back),
          label: 'Back',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Colors.amber,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.blueGrey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
        _onItemTapped();
      },
    );
  }
}
