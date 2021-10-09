import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/pages/bottom_nav.dart';
import 'package:machan_eats_application/pages/login.dart';
import 'package:machan_eats_application/providers/google_sign_in.dart';
import 'package:machan_eats_application/validators/database_user.dart';
import 'package:provider/provider.dart';



class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _userUpdateFormKey = GlobalKey<FormState>();
  String docId = " ";
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
  // final uid = FirebaseAuth.instance.currentUser!.uid;
  // final email = FirebaseAuth.instance.currentUser!.email;

  bool googleSignin = false;

  updateUser() async{
    await FirebaseAuth.instance.currentUser!.updatePassword(password);
    await DatabaseUser.updateUser(docId: docId, firstName: firstName, lastName: lastName, password: password, email: email,);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      backgroundColor: Colors.blueGrey,
      content: Text(
        'Updated successfully.',
        style: TextStyle(
            fontSize: 20.0
        ),
      ),
    ));
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: ListView(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 80.0),
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if(googleSignin){
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.logout();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
                    }else{
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
                    }

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
              stream: DatabaseUser.readUserInfo(),
              builder: (context,snapshot){
                //print(DatabaseUser.userId);
                if(snapshot.hasError){
                  return Text('Something went wrong');
                }
                else {

                    final user = FirebaseAuth.instance.currentUser!;

                    String gfirstName = "", glastName="";
                    if(user.displayName != null){
                      googleSignin = true;
                      List<String> names = user.displayName!.split(" ");
                      if(names.length>1){
                        gfirstName = user.displayName!.split(" ")[0];
                        glastName = user.displayName!.split(" ")[1];
                      }else{
                        gfirstName = user.displayName!.split(" ")[0];
                        glastName = " ";
                      }
                    }


                    String gemail = user.email!;
                    String gpassword = " ";
                  if(user.displayName != null){
                    firstNameController.text = gfirstName;
                    lastNameController.text = glastName;
                    emailController.text = gemail;
                    passwordController.text = gpassword;
                  }else{
                    var userInfo = snapshot.data!.docs[0].data() as Map<String, dynamic>;
                    docId = snapshot.data!.docs[0].id;

                    firstNameController.text = userInfo['firstName'];
                    lastNameController.text = userInfo['lastName'];
                    emailController.text = userInfo['email'];
                    passwordController.text = userInfo['password'];
                  }

                  return Form(
                    key: _userUpdateFormKey,
                    child:
                      ListView(
                        shrinkWrap: true,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 30.0),
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
                              enabled: user.displayName != null? false:true,
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
                              enabled: user.displayName != null? false:true,
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
                              enabled: false,
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
                              // validator: (value){
                              //   if(value == null || value.isEmpty){
                              //     return 'Please enter email';
                              //   }
                              //   else if(!value.contains('@')){
                              //     return 'Please enter valid email';
                              //   }
                              //   return null;
                              // },
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
                          user.displayName != null?
                          Container(
                            margin: const EdgeInsets.only(left: 20.0, top: 10.0),
                            height: 40,
                            child: TextFormField(
                              autofocus: false,
                              cursorHeight: 20.0,
                              enabled: false,
                              cursorColor: Colors.black,
                              initialValue: 'Password cannot be displayed',
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                fillColor: Colors.white70,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          )
                              :
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
                          user.displayName != null?SizedBox(height: 15,) : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  if(_userUpdateFormKey.currentState!.validate()){
                                    setState(() {
                                      firstName = firstNameController.text;
                                      lastName = lastNameController.text;
                                      email = emailController.text;
                                      password = passwordController.text;
                                    });
                                    updateUser();
                                  }
                                },
                                child: const Text(
                                  'UPDATE',
                                  style: TextStyle(
                                      fontSize: 18.0
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  );



                }

                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                  ),
                );

              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 3,),
    );
  }
}
