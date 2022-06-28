import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome,",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign in to contuine!",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF6F6F6),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset.fromDirection(-4, 4))
                    ],
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "E-mail",
                      prefixText: "   ",
                      hintStyle: TextStyle(color: Color(0xff969696))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF6F6F6),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: Offset.fromDirection(-4, 4))
                    ],
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        prefixText: "   ",
                        hintStyle: TextStyle(color: Color(0xff969696)))),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text("Forgot Password?"),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 100,
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "Login",
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t have an account?",
                  style: TextStyle(color: Color(0xff969696)),
                ),
                Text(
                  " Register now.",
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
