import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/pages/onboarding_pages/onboarding_page_1.dart';
import 'package:wardrobe_app/pages/onboarding_pages/onboarding_page_2.dart';
import 'package:wardrobe_app/pages/onboarding_pages/onboarding_page_3.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  OnboardingPage1(),
                  OnboardingPage2(),
                  OnboardingPage3(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotHeight: 5,
                      activeDotColor: Color(0xff323232),
                      dotColor: Color(0xff323232)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
