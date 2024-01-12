import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lc/screens/home_screen.dart';
import 'package:lc/view_model/common_view_model.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  _AddDataScreenState createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final TextEditingController modelController = TextEditingController();
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController kilometersController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController registrationController = TextEditingController();
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  int orderNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bike'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: modelController,
              decoration: const InputDecoration(labelText: 'Bike Model'),
            ),
            TextField(
              controller: conditionController,
              decoration: const InputDecoration(labelText: 'Condition'),
            ),
            TextField(
              controller: kilometersController,
              decoration: const InputDecoration(labelText: 'Kilometers'),
            ),
            TextField(
              controller: yearController,
              decoration: const InputDecoration(labelText: 'Make Year'),
            ),
            TextField(
              controller: registrationController,
              decoration: const InputDecoration(labelText: 'Registration'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                addBike();
                Navigator.pop(context);
              },
              child: const Text('Add Bike'),
            ),
          ],
        ),
      ),
    );
  }

  void addBike() {
    setState(() {
      orderNumber += 1;
      Map<String, String> products = {
        'bike_model': modelController.text,
        'condition': conditionController.text,
        'kilometers': kilometersController.text,
        'make_year': yearController.text,
        'registration': registrationController.text,
      };
      dbRef.child("bikes/$orderNumber").set(products);
      context.read<HomeViewModel>().getListingData();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }
}
