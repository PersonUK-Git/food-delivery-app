import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //get collection of order
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  //save orders to db
  Future<void> saveOrderToDatabase(String recipt) async{
    await orders.add({
      'date' : DateTime.now(),
      'recipt' : recipt,
    });
  }
}