import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wardrobe_app/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          icon: Image.asset("assets/icons/menu_icon.png"),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),*/
        title: SvgPicture.asset(
          "assets/app_bar_logo.svg",
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (val) {
            setState(() {
              index = val;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/tWardrobe.svg", width: 30),
                activeIcon:
                    SvgPicture.asset("assets/svg/bWardrobe.svg", width: 30),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/tComb.svg", width: 30),
                activeIcon: SvgPicture.asset("assets/svg/bComb.svg", width: 30),
                label: ""),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/tCalendar.svg", width: 30),
                activeIcon:
                    SvgPicture.asset("assets/svg/bCalendar.svg", width: 30),
                label: ""),
          ]),
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome Alisya!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text("Welcome to your Virtual Locker!",
                            style: TextStyle(color: Colors.white, fontSize: 13))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(10, (index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Add Category",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border:
                                    Border.all(color: primaryColor, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      }
                    }))),
          ],
        ),
      ),
    );
  }
}
