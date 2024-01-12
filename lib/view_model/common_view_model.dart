 import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier{

  Object? products;
  List productList = [];
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  getListingData() async {
    final snapshot = await ref.get();
    productList = [];
    if (snapshot.exists) {
      productList.add(snapshot.value);
      products = (snapshot.value);
      print("Product Listing response is" + snapshot.value.toString());
    } else {
      print('No Data Available');
    }
   notifyListeners();
  }
}