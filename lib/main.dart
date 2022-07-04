import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/pages/home_page/home_page.dart';
import 'package:wardrobe_app/pages/onboarding_pages/onboarding_page_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: primaryColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: primaryColor,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: primaryColor,
          )),
      home: OnboardingPage(),
    );
  }
}
