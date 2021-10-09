
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/home.dart';
import 'package:machan_eats_application/pages/login.dart';
import 'package:machan_eats_application/validators/database_user.dart';
// import 'package:machan_eats_application/validators/database_user.dart';

class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if(snapshot.hasData){
            print("Home");
            return Home();
          }else if(snapshot.hasError){
            return Center(child: Text('Something went wrong'));
          }else{
            print("Login");
            return LoginPage();
          }
        }
    )
  );

}
