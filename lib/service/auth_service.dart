import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  // firebase register user
  Future<User?> registerUser(
      String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      print("register User ${userCredential.user!.email}");
      setLoading(false);
      return userCredential.user;
    } on FirebaseAuthException catch (error) {
      setLoading(false);
      print("Exception - $error");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      setLoading(false);
      print(error);
    }
    setLoading(false);
    return null;
  }

  //Login User

  Future<User?> logInUser(
      String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.email);
      setLoading(false);
      return userCredential.user;
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message.toString()),
        backgroundColor: Colors.red,
      ));
      setLoading(false);
    } catch (error) {
      setLoading(false);
      print(error);
    }
    setLoading(false);
    return null;
  }

  Future signOut() async {
    setLoading(true);
    await firebaseAuth.signOut();
    setLoading(false);
  }
}
