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

  Future addProduct(String sellerName, String productName, String productPrice,
      String userId) async {
    try {
      await firebaseFirestore.collection('product').add({
        'sellerName': sellerName,
        'productName': productName,
        'productPrice': productPrice,
        'userId': userId
      });
    } catch (error) {
      print(error);
    }
  }

  Future updateProduct(String docId, String sellerName, String productName,
      String productPrice) async {
    try {
      await firebaseFirestore.collection('product').doc(docId).update({
        'sellerName': sellerName,
        'productName': productName,
        'productPrice': productPrice,
      });
    } catch (error) {
      print(error);
    }
  }

  Future deleteProduct(String docId) async {
    try {
      await firebaseFirestore.collection('product').doc(docId).delete();
    } catch (error) {
      print(error);
    }
  }
}
