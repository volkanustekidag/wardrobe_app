import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/styles.dart';

Padding textFromFieldBuild(String hintText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      decoration: BoxDecoration(
          boxShadow: textFromFieldShadow,
          color: secColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        obscureText: hintText.contains("Password") ? true : false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            prefixText: "   ",
            hintStyle: TextStyle(color: Color(0xff969696))),
      ),
    ),
  );
}
