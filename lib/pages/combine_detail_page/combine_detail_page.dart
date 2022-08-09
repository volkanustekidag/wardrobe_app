import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/data/menu_items.dart';
import 'package:wardrobe_app/models/menu_item.dart';
import 'package:sizer/sizer.dart';

class CombineDetailPage extends StatefulWidget {
  const CombineDetailPage({Key key}) : super(key: key);

  @override
  State<CombineDetailPage> createState() => _CombineDetailPageState();
}

class _CombineDetailPageState extends State<CombineDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Combine Details",
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
        actions: [
          PopupMenuButton<MenuItem>(
            icon: Icon(
              Icons.more_vert,
              color: primaryColor,
            ),
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) =>
                [...MenuItems.itemsFirst.map(buildItem).toList()],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: deviceHeight(context) * 0.9,
            child: ListView.builder(
              itemExtent: 200,
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    "assets/dress.png",
                    width: 100,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              width: deviceWidth(context),
              height: deviceHeight(context) * 0.1,
              decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: textFromFieldShadow,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "My summer combine",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
      value: item,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            item.iconData,
            color: Colors.black,
          ),
          Text(item.title),
        ],
      ));

  onSelected(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.itemEdit:
        print("edit");
        break;
      case MenuItems.itemDelete:
        print("delete");
        break;
    }
  }
}
