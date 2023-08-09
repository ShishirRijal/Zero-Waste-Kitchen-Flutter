import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zero_waste_kitchen/models/models.dart';

class FoodServices {
//* Fetch all food orders

  Future<List<FoodOrder>> getFoods(bool getDonations) async {
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
  Future<void> addFood(FoodOrder foodOrder, bool isDonation) async {
    String path = isDonation ? 'food_donations' : 'food_requests';
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Add the food order to the 'food_orders' collection
    await firestore.collection(path).add(foodOrder.toJson());
  }

  // * Accept a food order
  Future<void> acceptFood(FoodOrder foodOrder, bool isDonation) async {
    String path = isDonation ? 'food_donations' : 'food_requests';
    // Access the Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Update the food order
    await firestore
        .collection(path)
        .doc(foodOrder.id)
        .update({'isTaken': true});
  }
}
