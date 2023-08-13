import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zero_waste_kitchen/models/user_model.dart';

class UserServices {
  static final _firebaseFirestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<String?> uploadImage(XFile image) async {
    try {
      // Upload the image to Firebase Storage
      Reference storageReference =
          storage.ref('images').child('${DateTime.now()}.png');

      await storageReference.putFile(File(image.path));
      final imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    } catch (e) {
      // print(e);
      return null;
    }
  }

  static Future<void> createUser({
    required String id,
    required String email,
    required String name,
    required String imgUrl,
    required bool isDonor,
  }) async {
    try {
      await _firebaseFirestore.collection('users').doc(id).set({
        // assign id to current user uid
        'id': id,
        'email': email,
        'name': name,
        'imgUrl': imgUrl,
        'isDonor': isDonor,
      });
    } catch (e) {
      // print(e);
    }
  }

  static Future<void> updateUser({
    required String id,
    required String email,
    required String name,
    required String imgUrl,
    required bool isDonor,
  }) async {
    try {
      await _firebaseFirestore.collection('users').doc(id).update({
        'email': email,
        'name': name,
        'imgUrl': imgUrl,
        'isDonor': isDonor,
      });
    } catch (e) {
      // print(e);
    }
  }

  // get user
  static Future<User?> getUser(String id) async {
    try {
      final data = await _firebaseFirestore.collection('users').doc(id).get();
      // print('data => ${data.data()}');
      final user = User.fromJson(data.data() as Map<String, dynamic>);
      // print("user: ${user.email}");
      return user;
    } catch (e) {
      // print(e);
      // rethrow;
      return null;
    }
  }
}
