import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';
import 'package:sizer/sizer.dart';

import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:wardrobe_app/constants/styles.dart';

class MakeCombinePage extends StatefulWidget {
  const MakeCombinePage({Key key}) : super(key: key);

  @override
  State<MakeCombinePage> createState() => _MakeCombinePageState();
}

class _MakeCombinePageState extends State<MakeCombinePage> {
  int listLength = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Make Combine",
            style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 20.sp),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: primaryColor,
              )),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {}, label: Icon(Icons.save)),
        body: Container(
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: listLength,
            itemBuilder: (context, index) {
              print(index);
              if ((listLength - 1) == index) {
                return method2();
              } else {
                return method();
              }
            },
          ),
        ));
  }

  Padding method() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: deviceHeight(context) * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: widgetShadow,
        ),
        child: ListWheelScrollViewX(
            scrollDirection: Axis.horizontal,
            physics: FixedExtentScrollPhysics(),
            diameterRatio: 20,
            onSelectedItemChanged: (val) {
              print(val);
            },
            itemExtent: 500,
            children: [
              buildItem(0, "dress"),
              buildItem(1, "dress2"),
              buildItem(2, "dress3"),
              buildItem(3, "dress4"),
            ]),
      ),
    );
  }

  GestureDetector method2() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (listLength < 5) listLength++;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "+ Add Pieces",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Container buildItem(index, path) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Image.asset(
          "assets/${path}.png",
          width: 30.w,
        ),
      ),
    );
  }
}
