import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/constants/const.dart';

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
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Tuba Günaçgün",
          style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 20.sp),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: linearGradientList[
                        Random().nextInt(linearGradientList.length)])),
            height: deviceHeight(context),
          ),
          Column(
            children: [
              Container(
                height: deviceHeight(context) * 0.15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/price_tag.svg",
                                  width: 10.w,
                                ),
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                                Text("400\$")
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/hanger.svg",
                                  width: 10.w,
                                ),
                                Text(
                                  "Clothes",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                                Text("10")
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/bComb.svg",
                                  width: 10.w,
                                ),
                                Text(
                                  "Combines",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                ),
                                Text("10")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight(context) * 0.15,
              ),
              Flexible(
                child: Container(
                  height: deviceHeight(context) * 0.6,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      child: ListView(
                        children: [
                          ProfileCardItem(
                            title: "Update Password",
                            iconData: Icons.lock_open_sharp,
                          ),
                          ProfileCardItem(
                            title: "E-mail Verifyd",
                            iconData: Icons.mark_email_unread_outlined,
                          ),
                          ProfileCardItem(
                            title: "Delete Account",
                            iconData: Icons.delete_outline,
                          ),
                          ProfileCardItem(
                            title: "App Settings",
                            iconData: Icons.app_settings_alt_outlined,
                          ),
                          ProfileCardItem(
                            title: "Exit",
                            iconData: Icons.exit_to_app_outlined,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileCardItem extends StatelessWidget {
  final title;
  final iconData;
  const ProfileCardItem({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: ("Exit" == title || "Update Password" == title) ? 0 : 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        margin: EdgeInsets.zero,
        child: ListTile(
          leading: Icon(
            iconData,
            color: primaryColor,
          ),
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: primaryColor),
          ),
        ),
      ),
    );
  }
}
