import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/screens/app_bar.dart';
import 'package:machan_eats_application/screens/tablebookingScreens/addTableBookingScreen.dart';
import 'package:machan_eats_application/screens/tablebookingScreens/tableBookingList.dart';

class TableBookingScreen extends StatefulWidget {
  const TableBookingScreen({Key? key}) : super(key: key);

  @override
  _TableBookingScreenState createState() => _TableBookingScreenState();
}

class _TableBookingScreenState extends State<TableBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.amber,
          title: AppBarTitle(
            sectionName: '',
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTableBookingScreen(),
            ),
          );
        },
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.add,
          color: Colors.black,
          size:32,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12.0,bottom: 20.0,),
          child: TableBookingList(),
        ),
      ),
      bottomNavigationBar:
      BottomNavBar(selectedIndex:1,),
    );
  }
}
