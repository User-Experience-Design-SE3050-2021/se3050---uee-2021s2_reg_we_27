import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('dbusers');

class DatabaseUser {
  static String? userId;

  static Future<void> addUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,

  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('users').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "email":email,
      "password":password,
      "firstName":firstName,
      "lastName":lastName,
    };

    await documentReference.set(data).whenComplete(() => print("User inserted to the database")).catchError((e)=> print(e));
  }

  static Stream<QuerySnapshot> readUserInfo(){
    CollectionReference userCollection = _mainCollection.doc(userId).collection('users');
    return userCollection.snapshots();
  }

  static Future<void> updateUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String docId,
  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('users').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "email":email,
      "password":password,
      "firstName":firstName,
      "lastName":lastName,
    };

    await documentReference.set(data).whenComplete(() => print("User updated in the database")).catchError((e)=> print(e));
  }
}