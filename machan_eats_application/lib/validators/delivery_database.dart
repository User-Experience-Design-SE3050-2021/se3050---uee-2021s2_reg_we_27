import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('deliveries');

class Delivery_Database {
  static String? deliveryId;

  static Future<void> addDeliveryDetails({
    required String street,
    required String city,
    required String country,
    required String recieverName,
    required String mobileNum,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(deliveryId).collection('delivery').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "street": street,
      "city": city,
      "country": country,
      "recieverName": recieverName,
      "mobileNum": mobileNum,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Delivery details added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateDeliveryDetails({
    required String street,
    required String city,
    required String country,
    required String recieverName,
    required String mobileNum,
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(deliveryId).collection('delivery').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "street": street,
      "city": city,
      "country": country,
      "recieverName": recieverName,
      "mobileNum": mobileNum,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Delivery Details Updated "))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readDeliveryDetails() {
    CollectionReference deliveriesCollection =
        _mainCollection.doc(deliveryId).collection('delivery');

    return deliveriesCollection.snapshots();
  }

  static Future<void> deleteDeliveryDetails({
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(deliveryId).collection('delivery').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print("Delivery details deleted from the database"))
        .catchError((e) => print(e));
  }
}
