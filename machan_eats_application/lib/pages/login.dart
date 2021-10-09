import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/databases/tableBookingDB/tableBookingDatabase.dart';
import 'package:machan_eats_application/pages/home.dart';
import 'package:machan_eats_application/pages/signup.dart';
import 'package:machan_eats_application/providers/google_sign_in.dart';
import 'package:machan_eats_application/validators/database.dart';
import 'package:machan_eats_application/validators/database_user.dart';
import 'package:machan_eats_application/validators/delivery_database.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _loginFormKey = GlobalKey<FormState>();

  var email = " ";
  var password = " ";

  final emailController= TextEditingController();
  final passwordController= TextEditingController();

  userLogin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      DatabaseUser.userId = email;
      Database.userId = email;
      TableBookingDatabase.userId = email;
      Delivery_Database.deliveryId = email;
      print(Database.userId);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
    }on FirebaseAuthException catch(error){
      if(error.code == 'user-not-found'){
        print('No user with that email');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('No user with that email',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white
          ),
          ),
        ),
        );
        //emailController.text = " ";

      }
      else if (error.code == 'wrong-password'){
        print('Wrong password');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Wrong password',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white
            ),
          ),
        ));
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Padding(
          padding: EdgeInsets.only(left: 50.0, top: 5.0),
          child: Text(
              'Machan Eats',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: ListView(
            children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Flexible(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('assets/logo.jpg',height:70,)
                        ),
                    ),
                    const Flexible(
                      flex: 3,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: Text(
                              'Machan Eats',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 40,
                              ),
                            ),
                          ),
                      ),
                    ),
                  ],
                ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child:
                Text(
                  'Email address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                child: TextFormField(
                  autofocus: false,
                  cursorHeight: 20.0,
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  controller: emailController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter email';
                    }
                    else if(!value.contains('@')){
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child:
                Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  cursorHeight: 20.0,
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  controller: passwordController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          if(_loginFormKey.currentState!.validate()){
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                            });
                            userLogin();
                          }
                        },
                        child: const Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                            ),
                        ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70,),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.googleLogin();

                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          'LOGIN WITH GOOGLE',
                          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Don\'t have an account? ',
                        style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.w300),
                      ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context,a,b) => SignUp(), transitionDuration: const Duration(seconds: 0)));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                  ),
                  ),
                ]
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
