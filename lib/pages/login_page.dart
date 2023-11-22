import 'package:flutter/material.dart';
import 'package:walletwatch/components/btn.dart';
import 'package:walletwatch/components/textfield.dart';
import 'package:walletwatch/main.dart';
import 'package:walletwatch/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign in user
  void signIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Make the scaffold background transparent
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF000000), // Start color (#47B5FF)
              Color(0xFF06283D), // End color (#06283D)
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
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
                  Text(
                    "Control, Track, Grow, With WalletWatch",
                    style: TextStyle(
                      color: Color.fromRGBO(223, 246, 255, 100),
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 50),
                  MyTextField(
                    controller: usernameController,
                    hintText: "Username",
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
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
                  MyBtn(
                    onTap: signIn,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Haven't Signed Up?",
                        style: TextStyle(color: MyApp.textColor, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: Text(
                          " Register Now",
                          style: TextStyle(color: MyApp.btnColor, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/image/image8-2.webp",
                        height: 100,
                        width: 120,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
