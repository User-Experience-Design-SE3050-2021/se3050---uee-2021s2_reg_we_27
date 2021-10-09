import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machan_eats_application/validators/delivery_database.dart';
import 'commons.dart';
import 'edit_delivery_screen.dart';

class DeliveryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Delivery_Database.readDeliveryDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        } else if (snapshot.hasData || snapshot.data != null) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 16.0),
            separatorBuilder: (context, index) => SizedBox(height: 16.0),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var deliveryInfo =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              String docID = snapshot.data!.docs[index].id;
              String street = deliveryInfo['street'];
              String city = deliveryInfo['city'];
              String country = deliveryInfo['country'];
              String recieverName = deliveryInfo['recieverName'];
              String mobileNum = deliveryInfo['mobileNum'];

              return Ink(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditDeliveryScreen(
                        currentStreet: street,
                        currentCity: city,
                        currentRecieverName: recieverName,
                        currentCountry: country,
                        currentMobileNum: mobileNum,
                        documentId: docID,
                      ),
                    ),
                  ),
                  title: Text(
                    recieverName,
                    style: TextStyle(color: black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    country,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
          ),
        );
      },
    );
  }
}
