import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';
import 'package:zero_waste_kitchen/widgets/popups.dart';

class AuthController extends ChangeNotifier {
  Stream<User?> get authStateChanges =>
      FirebaseAuth.instance.authStateChanges();

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) //catches errors from firebase authentication
    {
      String error = 'An unknown error occurred';

      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        error = 'Invalid email address.';
      }
      showDialog(
          context: context, builder: (context) => ErrorPopup(errorText: error));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) =>
              const ErrorPopup(errorText: 'An unknown error occurred'));
    }
  }

  Future<bool?> signUp(
      BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // now trigger the  authStateChanges method to update the UI
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) //catches errors from firebase authentication
    {
      String error = 'An unknown error occurred';

      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        error = 'An account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        error = 'Invalid email address.';
      }
      showDialog(
          context: context, builder: (context) => ErrorPopup(errorText: error));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) =>
              const ErrorPopup(errorText: 'An unknown error occurred'));
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
