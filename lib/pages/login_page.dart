import 'package:flutter/material.dart';
import 'package:walletwatch/components/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwoedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(6, 40, 61, 100),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            //logo
            SizedBox(
              height: 50,
            ),

            Image.asset(
              "lib/image/normal.png",
              height: 120,
              width: 120,
            ),

            SizedBox(
              height: 50,
            ),

            //welcome back
            Text(
              "Control, Track, Grow, With WalletWatch",
              style: TextStyle(
                  color: Color.fromRGBO(223, 246, 255, 100), fontSize: 16),
            ),
            SizedBox(height: 50),

            //username
            MyTextField(
              controller: usernameController,
              hintText: "Username",
              obscureText: false,
            ),

            SizedBox(
              height: 25,
            ),

            //password
            MyTextField(
              controller: usernameController,
              hintText: "Password",
              obscureText: true,
            ),

            //forgot password

            //sign in button

            //or continue with

            //google

            //register now
          ]),
        ),
      ),
    );
  }
}
