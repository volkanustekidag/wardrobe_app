import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/pages/login_page/login_page.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.2,
                  child: SvgPicture.asset(
                    "assets/ready.svg",
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    'I think we are ready now!',
                    style: onboardingTitleStyle,
                  ),
                ),
                Expanded(
                  child: Text('So lets get started right away!',
                      style: onboardingContentStyle),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (buildContext) => LoginPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "\nLet's Start!\n",
                    ),
                  ),
                  style: ElevatedButton.styleFrom(primary: Color(0xff323232)),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
