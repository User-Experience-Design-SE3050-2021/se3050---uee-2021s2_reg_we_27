import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('dbusers');

class Database {
  static String? userId;

  static Future<void> addEvent({
    required String title,
    required String description,
    required String noOfInvites,
    required String date,
    required String startingTime,
    required String closingTime,


  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('events').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "title":title,
      "description":description,
      "noOfInvites":noOfInvites,
      "date":date,
      "startingTime":startingTime,
      "closingTime":closingTime,
    };

    await documentReference.set(data).whenComplete(() => print("Note events inserted to the database")).catchError((e)=> print(e));
  }

  static Future<void> addCard({
    required String nameOnCard,
    required String cardNumber,
    required String expirationDate,
    required String cvv,
    required String amount,



  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('cards').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "nameOnCard":nameOnCard,
      "cardNumber":cardNumber,
      "expirationDate":expirationDate,
      "cvv":cvv,
      "amount":amount,
    };

    await documentReference.set(data).whenComplete(() => print("Note card details inserted to the database")).catchError((e)=> print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String description,
    required String docId,
  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('item').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "title":title,
      "description":description,
    };

    await documentReference.set(data).whenComplete(() => print("Note item updated to the database")).catchError((e)=> print(e));
  }

  static Stream<QuerySnapshot> readEvents(){
    CollectionReference EventsCollection = _mainCollection.doc(userId).collection('events');

    return EventsCollection.snapshots();
  }

  static Future<void> deleteEvent({
    required String docId,
  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('events').doc(docId);

    await documentReference.delete().whenComplete(() => print("Note events deleted from the database")).catchError((e)=>print(e));
  }
}