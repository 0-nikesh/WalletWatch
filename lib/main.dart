import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walletwatch/firebase_options.dart';
import 'package:walletwatch/pages/login_page.dart';
import 'package:walletwatch/pages/receipts_page.dart';
import 'package:walletwatch/pages/statistics_page.dart';
import 'package:walletwatch/pages/transaction_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static User? currentUser;

  const MyApp({super.key});

  static const Color textColor = Color.fromRGBO(223, 246, 255, 100);
  static const Color bgColor = Color.fromRGBO(6, 40, 61, 100);
  static const Color btnColor = Color.fromARGB(156, 71, 181, 255);
  static const Color logoColor = Color.fromRGBO(37, 109, 133, 100);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(
        onTap: () {},
      ),
      routes: {
        '/statistics': (context) => StatisticPage(),
        '/transaction': (context) => TransactionPage(),
        '/receipt': (context) => ReceiptPage(),
      },
    );
  }
}
//trying trying