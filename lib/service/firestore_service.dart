import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // insert seller name & about
  Future insertNameAbout(String name, String about, String userId) async {
    try {
      await firebaseFirestore
          .collection('user_bio')
          .add({'name': name, 'about': about, 'userId': userId});
    } catch (error) {
      print(error);
    }
  }

  Future addProduct(String productName, String productCount,
      String productPrice, String userId) async {
    try {
      await firebaseFirestore.collection('product').add({
        'productName': productName,
        'productCount': productCount,
        'productPrice': productPrice,
        'userId': userId
      });
    } catch (error) {
      print(error);
    }
  }
}
