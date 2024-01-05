import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:walletwatch/components/list.dart';
import 'package:walletwatch/components/my_card.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Retrieve the current user or default to null if not signed in
  final user = FirebaseAuth.instance.currentUser;
  FirebaseDatabase database = FirebaseDatabase.instance;

  final pgcontroller = PageController();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
          iconSize: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
                iconSize: 40,
                color: Colors.blue[300],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
                iconSize: 40,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //appBar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                          "Wallet",
                          style: TextStyle(fontSize: 28),
                        ),
                      ],
                    ),

                    //logout button
                    GestureDetector(
                      onTap: () {
                        signUserOut(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(66, 165, 245, 1),
                            shape: BoxShape.circle),
                        child: IconButton(
                          iconSize: 30,
                          onPressed: () {
                            signUserOut(context);
                          },
                          icon: Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //cards
              Container(
                height: 150,
                child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pgcontroller,
                    children: [
                      MyCard(
                        type: 'Balance',
                        balance: 1200,
                        color: Colors.blue[400],
                      ),
                      MyCard(
                        type: 'Expense',
                        balance: 11550,
                        color: Colors.green[300],
                      ),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              SmoothPageIndicator(
                  controller: pgcontroller,
                  count: 2,
                  effect: SwapEffect(
                    activeDotColor: Colors.blue,
                  )),
              SizedBox(
                height: 20,
              ),

              //buttons of bills
              List(
                  name: 'Statistics',
                  img: Image.asset('lib/image/stat.png'),
                  desc: 'Payment and Income Chart',
                  onTap: () {
                    Navigator.pushNamed(context, '/statistics');
                  }),

              List(
                  name: 'Transaction',
                  img: Image.asset('lib/image/cash-flow.png'),
                  desc: 'Transaction History',
                  onTap: () {
                    Navigator.pushNamed(context, '/transaction');
                  }),

              List(
                  name: 'Reciepts',
                  img: Image.asset('lib/image/bill.png'),
                  desc: 'Bill of transactions',
                  onTap: () {
                    Navigator.pushNamed(context, '/receipt');
                  }),

              //column for statistics and transactions
              //
            ],
          ),
        ),
      ),
    );
  }
}
