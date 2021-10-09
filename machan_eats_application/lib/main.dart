import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/screens/EventsView.dart';
import 'package:machan_eats_application/validators/database.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
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

        Database.userId = ' GUptOWT4wGkHjq6g7gg2';
        return MaterialApp(
          title: 'Machan Eats',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          home: EventsView(),
        );
      },
    );
  }
}