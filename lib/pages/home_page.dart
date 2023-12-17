import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Retrieve the current user or default to null if not signed in
  final user = FirebaseAuth.instance.currentUser;

  // Sign out user
  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(
              onTap: () {})), // Replace LoginPage with your actual login page
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            //appBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "My ",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Balance",
                        style: TextStyle(fontSize: 28),
                      ),
                    ],
                  ),

                  //plus button
                  Icon(Icons.add),
                ],
              ),
            )

            //cards

            //buttons of bills

            //column for statistics and transactions

            //
          ],
        ),
      ),
    );
  }
}
