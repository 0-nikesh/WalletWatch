import 'package:flutter/material.dart';
import 'package:walletwatch/main.dart';

class MyBtn extends StatelessWidget {
  final Function()? onTap;
  const MyBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 80),
        decoration: BoxDecoration(
            color: MyApp.btnColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          "Sign In",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
