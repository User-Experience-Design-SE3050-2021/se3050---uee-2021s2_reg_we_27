import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:machan_eats_application/pages/login.dart';
import 'package:machan_eats_application/validators/database_user.dart';


class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signupFormKey = GlobalKey<FormState>();

  var firstName = " ";
  var lastName = " ";
  var email = " ";
  var password = " ";

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  registration() async{
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        print(userCredential);
        DatabaseUser.userId = email;
        await DatabaseUser.addUser(firstName: firstName, lastName: lastName, email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            'Registered successfully. Please Sign in.',
            style: TextStyle(
              fontSize: 20.0
            ),
          ),
        ));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage(),),);
      }on FirebaseAuthException catch(error){
        if(error.code == 'weak-password'){
          print('Password too weak');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              'Password too weak.',
              style: TextStyle(
                  fontSize: 20.0,
                color: Colors.amberAccent
              ),
            ),
          ));
        }
        else if(error.code == 'email-already-in-use'){
          print('Account already exists.');
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.black,
            content: Text(
              'Account already exists.',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.amberAccent
              ),
            ),
          ));
        }
    }
    
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
        key: _signupFormKey,
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
                  'Sign up',
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
                  'First Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                height: 40,
                child: TextFormField(
                  autofocus: false,
                  cursorHeight: 20.0,
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  controller: firstNameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter first name';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                child:
                Text(
                  'Last Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                height: 40,
                child: TextFormField(
                  autofocus: false,
                  cursorHeight: 20.0,
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  controller: lastNameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter last name';
                    }
                    return null;
                  },
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
                height: 40,
                child: TextFormField(
                  autofocus: false,cursorHeight: 20.0,
                  cursorColor: Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.black,
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
                height: 40,
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
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    errorStyle: TextStyle(
                      color: Colors.black,
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
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        if(_signupFormKey.currentState!.validate()){
                          setState(() {
                            firstName = firstNameController.text;
                            lastName = lastNameController.text;
                            email = emailController.text;
                            password = passwordController.text;
                          });
                          registration();
                        }
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(
                          fontSize: 18.0
                        ),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
