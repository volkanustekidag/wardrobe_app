import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:sizer/sizer.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({Key key}) : super(key: key);

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
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
          "App Settings",
          style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 16.sp),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: Icon(
                Icons.language,
                color: primaryColor,
              ),
              title: Text(
                "Language",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: primaryColor),
              ),
            ),
          ),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: Icon(
                Icons.comment_outlined,
                color: primaryColor,
              ),
              title: Text(
                "About Us",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: primaryColor),
              ),
            ),
          ),
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            margin: EdgeInsets.zero,
            child: ListTile(
              leading: Icon(
                Icons.feedback_outlined,
                color: primaryColor,
              ),
              title: Text(
                "FeedBack",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: primaryColor),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("App version: 0.1"),
          )
        ],
      ),
    );
  }
}
