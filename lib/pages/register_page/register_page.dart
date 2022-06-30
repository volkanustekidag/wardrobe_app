import 'package:flutter/material.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/pages/login_page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState();

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
                child: Text("Create Account,", style: titleStyleBold),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:
                    Text("Sign up to get started!", style: titleStyleRegular),
              ),
              Spacer(),
              textFromFieldBuild("Full name"),
              textFromFieldBuild("E-mail"),
              textFromFieldBuild("Password"),
              textFromFieldBuild("Password"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "\nRegister\n",
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you have an account? ",
                    style: TextStyle(color: Color(0xff969696)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (buildContext) => LoginPage()));
                    },
                    child: Text(
                      " Login now.",
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
