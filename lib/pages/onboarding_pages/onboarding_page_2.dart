import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/styles.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.1,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: Image.asset("assets/logo/onboarding2_image.png"))
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create your clothing calendar!',
                      style: onboardingTitleStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        'Plan what you will wear on which day with the combinations you make or the clothes you add.',
                        style: onboardingContentStyle),
                  ),
                ),
                Spacer(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
