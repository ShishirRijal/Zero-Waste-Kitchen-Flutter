import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:zero_waste_kitchen/models/models.dart';
import 'package:zero_waste_kitchen/screens/main/main_screen.dart';

class FoodServices {
//* Fetch all food orders
  static Future<List<FoodOrder>> getFoods({required getDonations}) async {
    String path = getDonations ? 'food_donations' : 'food_requests';
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query the 'food_orders' collection
    QuerySnapshot querySnapshot = await firestore.collection(path).get();

    // Extract data from the query snapshot
    List<FoodOrder> foodOrders = [];
    for (var document in querySnapshot.docs) {
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      FoodOrder foodOrder = FoodOrder.fromJson(data);
      foodOrders.add(foodOrder);
    }

    return foodOrders;
  }

  // * Add a new food order
  static Future<bool> addFood(
      BuildContext context, File image, foodOrder, bool isDonation) async {
    String path = isDonation ? 'food_donations' : 'food_requests';
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Add the food order to the 'food_orders' collection
    try {
      // Upload the image to Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageReference =
          storage.ref('images').child('${DateTime.now()}.png');

      await storageReference.putFile(File(image.path));
      final imageUrl = await storageReference.getDownloadURL();
      // update food image link
      foodOrder.imageUrl = imageUrl;
      await firestore.collection(path).add(foodOrder.toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  // * Accept a food order
  static Future<void> acceptFood(FoodOrder foodOrder, bool isDonation) async {
    String path = isDonation ? 'food_donations' : 'food_requests';
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Update the food order
    await firestore
        .collection(path)
        .doc(foodOrder.id)
        .update({'isTaken': true});
  }

  //* Update user service count
  static Future<void> updateServiceCount(BuildContext context) async {
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Update the service count
    try {
      await firestore
          .collection('users')
          .doc(currentUser!.id)
          .update({'noOfServices': FieldValue.increment(1)});
    } catch (e) {
      rethrow;
    }
  }
}
