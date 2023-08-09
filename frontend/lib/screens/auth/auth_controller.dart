import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero_waste_kitchen/utils/shared_prefs.dart';
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
      // update the shared prefs
      // ignore: use_build_context_synchronously
      await context.read<SharedPrefs>().setAuthStatus();
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
      // update the shared prefs
      // ignore: use_build_context_synchronously
      await context.read<SharedPrefs>().setAuthStatus();
      // now trigger the  authStateChanges method to update the UI
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
    return false;
  }

  // forgot password
  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) => const SuccessPopup(
                message: 'Password reset email has been sent to your email',
              ));
    } on FirebaseAuthException catch (e) //catches errors from firebase authentication
    {
      String error = 'An unknown error occurred';

      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
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

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // update the shared prefs
    // ignore: use_build_context_synchronously
    await context.read<SharedPrefs>().clearAuthStatus();
  }
}
