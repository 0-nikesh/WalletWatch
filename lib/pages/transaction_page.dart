import 'package:flutter/material.dart';
import 'package:walletwatch/main.dart'; // Import your main.dart file to access MyApp.currentUser
import 'package:walletwatch/services/firebase_service.dart';

class TransactionPage extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder(
        future: _firebaseService.fetchDataFromFirebase(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> transactions = snapshot.data!;

            // Filter transactions based on user ID
            transactions = transactions
                .where((transaction) =>
                    transaction['userId'] == MyApp.currentUser?.uid)
                .toList();

            // Sort transactions based on dateTime field
            transactions.sort((a, b) {
              DateTime dateTimeA = DateTime.parse(a['dateTime']);
              DateTime dateTimeB = DateTime.parse(b['dateTime']);
              return dateTimeB.compareTo(dateTimeA);
            });

            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> transaction = transactions[index];
                Color tileColor = transaction['type'] == 'Income'
                    ? Color.fromARGB(255, 228, 248, 205)
                    : const Color.fromARGB(255, 247, 186, 186);
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: ListTile(
                    title: Text('Category: ${transaction['category']}'),
                    subtitle: Text('Cost: Rs. ${transaction['cost']}'),
                    trailing: Text('Type: ${transaction['type']}'),
                    tileColor: tileColor,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
