import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/data/menu_items.dart';
import 'package:wardrobe_app/models/menu_item.dart';
import 'package:wardrobe_app/widgets/season_item_button.dart';

class ClothesDetail extends StatefulWidget {
  const ClothesDetail({Key key}) : super(key: key);

  @override
  State<ClothesDetail> createState() => _ClothesDetailState();
}

class _ClothesDetailState extends State<ClothesDetail> {
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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: secColor,
                boxShadow: widgetShadow,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            height: deviceHeight(context) * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      maxRadius: 6.sp,
                      minRadius: 5,
                    ),
                  ),
                ),
                Expanded(
                  child: Hero(
                    tag: 0,
                    child: Image.asset(
                      "assets/dress.png",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: primaryColor,
                        size: 12.sp,
                      ),
                      Icon(
                        Icons.favorite,
                        color: primaryColor,
                        size: 12.sp,
                      ),
                      Icon(
                        Icons.favorite,
                        color: primaryColor,
                        size: 12.sp,
                      ),
                      Icon(
                        Icons.favorite,
                        color: primaryColor,
                        size: 12.sp,
                      ),
                      Icon(
                        Icons.favorite,
                        color: favoriteIconColor,
                        size: 12.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Yellow Dress",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: Colors.black)),
                      Text("50£",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.sp,
                              color: Colors.black))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("My best favorite dress",
                      style: TextStyle(fontSize: 12.sp, color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CustomSeasonItemButton(
                        buttonTitle: "Summer",
                        isSelected: true,
                      ),
                      CustomSeasonItemButton(
                        buttonTitle: "Spring",
                        isSelected: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("BERSHKA",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(Icons.link),
                      GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Link",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ],
                  ),
                ),
              ],
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
