import 'package:flutter/material.dart';
import 'package:walletwatch/components/btn.dart';
import 'package:walletwatch/components/textfield.dart';
import 'package:walletwatch/main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(6, 40, 61, 100),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                //logo
                SizedBox(
                  height: 80,
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
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                SizedBox(height: 20),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password ?",
                        style: TextStyle(color: MyApp.textColor),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                //sign in button

                MyBtn(
                  onTap: signIn,
                ),

                SizedBox(
                  height: 20,
                ),

                //register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haven't Signed Up?",
                      style: TextStyle(color: MyApp.textColor, fontSize: 15),
                    ),
                    Text(
                      " Register Now",
                      style: TextStyle(color: MyApp.btnColor, fontSize: 18),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.3,
                          color: MyApp.textColor,
                        ),
                      ),
                      Text(
                        "Or Continue with",
                        style: TextStyle(color: MyApp.textColor),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.3,
                          color: MyApp.textColor,
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //google

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("lib/image/image8-2.webp",
                        height: 100, width: 120)
                  ],
                )
              ]),
            ),
          ),
        ));
  }
}
