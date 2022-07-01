import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset("assets/icons/menu_icon.png"),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        title: Image.asset(
          "assets/logo/appbar_logo.png",
          width: 40,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/tWardrobe.png", width: 24),
                activeIcon:
                    Image.asset("assets/icons/bWardrobe.png", width: 24),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/tComb.png", width: 24),
                activeIcon: Image.asset("assets/icons/bComb.png", width: 24),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/tCalendar.png", width: 24),
                activeIcon:
                    Image.asset("assets/icons/bCalendar.png", width: 24),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset("assets/icons/tUser.png", width: 24),
                activeIcon: Image.asset("assets/icons/bUser.png", width: 24),
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
