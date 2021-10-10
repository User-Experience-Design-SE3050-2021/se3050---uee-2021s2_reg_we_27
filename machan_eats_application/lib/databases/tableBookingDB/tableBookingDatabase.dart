import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');

class TableBookingDatabase {
  static String? userId;

  static Future<void> addTableBooking({
    required String purpose,
    required String branch,
    required String tableSize,
    required String decorationTheme,
    required String date,
    required String time,
})async{
      DocumentReference documentReference = _mainCollection.doc(userId).collection('tableBookings').doc();
      
      Map<String, dynamic> data = <String, dynamic>{
        "purpose":purpose,
        "branch":branch,
        "tableSize":tableSize,
        "decorationTheme":decorationTheme,
        "date":date,
        "time":time,
      };
      
      await documentReference.set(data).whenComplete(() => print("Table Booking Inserted to the database")).catchError((e)=> print(e));
}

  static Future<void> updateTableBooking({
    required String purpose,
    required String branch,
    required String tableSize,
    required String decorationTheme,
    required String date,
    required String time,
    required String docId,
  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('tableBookings').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "purpose":purpose,
      "branch":branch,
      "tableSize":tableSize,
      "decorationTheme":decorationTheme,
      "date":date,
      "time":time,
    };

    await documentReference.set(data).whenComplete(() => print("Table Booking Updated to the database")).catchError((e)=> print(e));
  }

  static Stream<QuerySnapshot> retrieveTableBooking(){
    CollectionReference tableBookingCollection = _mainCollection.doc(userId).collection('tableBookings');

    return tableBookingCollection.snapshots();
  }

  static Future<void> deleteTableBooking({
    required String docId,
  })async{
    DocumentReference documentReference = _mainCollection.doc(userId).collection('tableBookings').doc(docId);
    
    await documentReference.delete().whenComplete(() => print("Table Booking Deleted from the database")).catchError((e)=>print(e));
  }
}