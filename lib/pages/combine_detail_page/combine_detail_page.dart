import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: secColor,
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                color: secColor,
                height: deviceHeight(context) * 0.8,
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
                  height: deviceHeight(context) * 0.2,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))),
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
          Positioned(
            bottom: deviceHeight(context) * 0.01,
            right: deviceWidth(context) * 0.05,
            child: Container(
              decoration: BoxDecoration(
                  color: secColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("50£",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12.sp)),
              ),
            ),
          ),
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
