import 'package:flutter/material.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/styles.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  _ForgotPasswordPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
      ),
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
                child: Text("Come back to us,", style: titleStyleBold),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Reset password!", style: titleStyleRegular),
              ),
              Spacer(),
              textFromFieldBuild("E-mail"),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "\nReset Password\n",
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
