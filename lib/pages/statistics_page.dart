import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:walletwatch/services/firebase_service.dart';

class StatisticPage extends StatelessWidget {
  static double totalIncome = 0;
  static double totalExpense = 0;

  static void updateTotals(List<Map<String, dynamic>> transactions) {
    totalIncome = 0;
    totalExpense = 0;
    transactions.forEach((transaction) {
      if (transaction['type'] == 'Income' && transaction['cost'] != null) {
        totalIncome += transaction['cost'];
      } else if (transaction['type'] == 'Expense' &&
          transaction['cost'] != null) {
        totalExpense += transaction['cost'];
      }
    });
  }

  final FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: FutureBuilder(
        future: firebaseService.fetchDataFromFirebase(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> transactions = snapshot.data ?? [];
            print('Fetched transactions: $transactions');

            updateTotals(transactions);

            print('Total Income: $totalIncome, Total Expense: $totalExpense');

            return Center(
              child: PieChart(
                dataMap: {
                  'Income': totalIncome,
                  'Expense': totalExpense,
                },
                chartRadius: MediaQuery.of(context).size.width / 2.0,
                chartType: ChartType.disc,
              ),
            );
          }
        },
      ),
    );
  }
}
