import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<List<Map<String, dynamic>>> fetchDataFromFirebase() async {
    // Use try-catch block to handle potential errors
    try {
      // Wait for the database event
      DatabaseEvent event = await _database.child('transactions').once();

      // Extract DataSnapshot from the event
      DataSnapshot dataSnapshot = event.snapshot;

      // Check if the snapshot has data
      if (dataSnapshot.value != null) {
        // Convert snapshot data to list of maps
        List<Map<String, dynamic>> transactions = [];
        (dataSnapshot.value as Map<dynamic, dynamic>).forEach((key, value) {
          transactions.add(Map<String, dynamic>.from(value));
        });

        return transactions;
      } else {
        // Return an empty list if no data is available
        return [];
      }
    } catch (error) {
      // Handle any potential errors
      print('Error fetching data from Firebase: $error');
      throw error; // Re-throw the error for higher level handling
    }
  }
}
