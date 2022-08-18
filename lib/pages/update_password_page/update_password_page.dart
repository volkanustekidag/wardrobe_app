import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/constants/const.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            )),
        title: Text(
          "Update Password",
          style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 16.sp),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          children: [
            textFromFieldBuild("Old Password"),
            textFromFieldBuild("New Password"),
            textFromFieldBuild("New Again Password"),
            SizedBox(
              height: deviceHeight(context) * 0.1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "\nUpdate Password\n",
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
