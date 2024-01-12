import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class EditDataScreen extends StatefulWidget {
  const EditDataScreen();

  @override
  _EditDataScreenState createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  late TextEditingController modelController;
  late TextEditingController conditionController;
  late TextEditingController kilometersController;
  late TextEditingController yearController;
  late TextEditingController registrationController;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  int bikeIdIndex = 1; // You might want to initialize or update this based on your application logic

  @override
  void initState() {
    super.initState();
    modelController = TextEditingController();
    conditionController = TextEditingController();
    kilometersController = TextEditingController();
    yearController = TextEditingController();
    registrationController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Bike'),
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
                updateBike();
                Navigator.pop(context);
              },
              child: const Text('Update Bike'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                deleteBike();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('Delete Bike'),
            ),
          ],
        ),
      ),
    );
  }

  void updateBike() {
    dbRef.child("bikes/$bikeIdIndex").update({
      'bike_model': modelController.text,
      'condition': conditionController.text,
      'kilometers': int.tryParse(kilometersController.text) ?? 0,
      'make_year': int.tryParse(yearController.text) ?? 0,
      'registration': registrationController.text,
    });
  }

  void deleteBike() {
    dbRef.child("bikes/$bikeIdIndex").remove();
  }
}
