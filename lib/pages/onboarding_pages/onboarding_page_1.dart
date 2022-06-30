import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/styles.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.25,
                    child: Image.asset("assets/logo/onboarding_logo.png"))
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Welcome Alisya!',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 30)),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Build your closet!',
                      style: onboardingTitleStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'You can categorize and search all the clothes and \naccessories in your closet by adding your photo.',
                        style: onboardingContentStyle),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Build your closet!',
                      style: onboardingTitleStyle,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can categorize and search all the clothes and \naccessories in your closet by adding your photo.',
                      style: onboardingContentStyle,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
