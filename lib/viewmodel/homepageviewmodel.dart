import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walletwatch/model/transaction.dart';
import 'package:walletwatch/services/firebase_service.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseService firebaseService = FirebaseService();
  late final User? user;
  final PageController pgcontroller = PageController();
  double totalIncome = 0.0;
  double totalExpense = 0.0;
  List<Transaction> transactions = [];

  HomeViewModel() {
    user = FirebaseAuth.instance.currentUser;
    fetchTotalsFromFirebase();
  }

  Future<void> fetchTotalsFromFirebase() async {
    try {
      transactions =
          (await firebaseService.fetchDataFromFirebase()).cast<Transaction>();

      // Filter transactions for the logged-in user
      transactions = transactions
          .where((transaction) => transaction.userId == user?.uid)
          .toList();

      // Calculate total income and total expense
      double income = 0.0;
      double expense = 0.0;
      for (var transaction in transactions) {
        if (transaction.type == 'Income') {
          income += transaction.cost!;
        } else if (transaction.type == 'Expense') {
          expense += transaction.cost!;
        }
      }

      // Update state with calculated totals
      totalIncome = income;
      totalExpense = expense;

      notifyListeners();
    } catch (error) {
      print('Error fetching totals: $error');
      // Re-throw the error for higher-level handling
      throw error;
    }
  }
}
