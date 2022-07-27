import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';

double deviceHeight(context) => MediaQuery.of(context).size.height;
double deviceWidth(context) => MediaQuery.of(context).size.width;

const BoxDecoration modalBottomSheetBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topRight: Radius.circular(30), topLeft: Radius.circular(30)),
);

const BoxDecoration boxDecorationItem = BoxDecoration(
    color: secColor,
    borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30)));
