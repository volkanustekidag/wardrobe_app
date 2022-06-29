import 'package:flutter/material.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/screens/forgot_password_page/forgot_password_page.dart';
import 'package:wardrobe_app/screens/register_page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Spacer(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Welcome,", style: titleStyleBold),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Sign in to contuine!", style: titleStyleRegular),
              ),
              Spacer(),
              textFromFieldBuild("E-mail"),
              textFromFieldBuild("Password"),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (buildContext) => ForgotPasswordPage()));
                    },
                    child: Text("Forgot Password?")),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "\nLogin\n",
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (buildContext) => RegisterPage()));
                    },
                    child: Text(
                      " Register now.",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
