import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/scr/screens/foodorder_main.dart';
import 'package:machan_eats_application/scr/screens/restaurant.dart';
import 'package:machan_eats_application/validators/delivery_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  //const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
      if(snapshot.hasError){
        print('Error occured');
      }

      if(snapshot.connectionState == ConnectionState.waiting){
        return const Center(child: CircularProgressIndicator(),);
      }
      Delivery_Database.deliveryId = "ZCVQLirrW2a8rJ0EWrwP";
      return MaterialApp(
      title: 'Matchan Eats',
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(

        primarySwatch: Colors.amber,
      ),
        home: Restaurants(),
    );
        },
    );
  }
}






