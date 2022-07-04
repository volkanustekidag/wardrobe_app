import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/pages/home_page/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
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
        home: HomePage(),
      );
    });
  }
}
