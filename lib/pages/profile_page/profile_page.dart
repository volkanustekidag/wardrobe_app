import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Fernanda Morales",
          style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 20.sp),
        ),
      ),
      body: Container(),
    );
  }
}
