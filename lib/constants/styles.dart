import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';

const TextStyle titleStyleBold =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 36);

const TextStyle titleStyleRegular =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 20);

const TextStyle onboardingTitleStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 20);

const TextStyle onboardingContentStyle = TextStyle(fontSize: 15);

List<BoxShadow> widgetShadow = [
  BoxShadow(
      color: secColor,
      blurRadius: 5,
      spreadRadius: 0,
      offset: Offset.fromDirection(-4, 4))
];
