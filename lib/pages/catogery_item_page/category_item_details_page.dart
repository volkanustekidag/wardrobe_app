import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/widgets/filter_card_item_button.dart';
import 'package:wardrobe_app/widgets/season_item_button.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/constants/strings.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/data/menu_items.dart';
import 'package:wardrobe_app/models/menu_item.dart';
import 'package:wardrobe_app/pages/clothes_detail_page/clothes_detail_page.dart';

class CategoryItemDetailsPage extends StatefulWidget {
  const CategoryItemDetailsPage({Key key}) : super(key: key);

  @override
  State<CategoryItemDetailsPage> createState() =>
      _CategoryItemDetailsPageState();
}

class _CategoryItemDetailsPageState extends State<CategoryItemDetailsPage> {
  List<bool> isSelected = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Dresses",
            style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 20.sp)),
        centerTitle: true,
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
            onSelected: (value) => onSelected(context, value),
            icon: Icon(
              Icons.more_vert,
              color: primaryColor,
            ),
            itemBuilder: (context) =>
                [...MenuItems.itemsFirst.map(buildItem).toList()],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            addDressModalBottomSheetBuild(context);
          },
          label: Icon(Icons.add)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: deviceHeight(context) * 0.07,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: textFromFieldShadow,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          filterModalBottomSheetBuild(context);
                        },
                        icon: Row(
                          children: [
                            Icon(
                              Icons.filter_alt_outlined,
                              color: primaryColor,
                            ),
                            Expanded(
                                child: Text(
                              "Filter",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor,
                                  fontSize: 12.sp),
                            ))
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 2,
                      child: IconButton(
                        onPressed: () {
                          showModalCupertinoPickerBuild(context);
                        },
                        icon: Row(
                          children: [
                            Icon(
                              Icons.swap_horiz_outlined,
                              color: primaryColor,
                            ),
                            Expanded(
                                child: Text(
                              "Short",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: primaryColor,
                                  fontSize: 12.sp),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClothesDetail()));
                      },
                      child: Hero(
                        tag: index,
                        child: Container(
                          height: deviceHeight(context) * 0.1,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: textFromFieldShadow,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                    maxRadius: 6.sp,
                                    minRadius: 5,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Image.asset(
                                    "assets/dress.png",
                                    width: 30.w,
                                  ),
                                ),
                                DefaultTextStyle(
                                  style: TextStyle(),
                                  child: Text("Yellow Dress",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.black)),
                                ),
                                Row(
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
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> filterModalBottomSheetBuild(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: modalBottomSheetBoxDecoration,
          height: deviceHeight(context) * 0.9,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:
                            Text("Cancel", style: TextStyle(fontSize: 12.sp))),
                    Text(
                      "Filter",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(
                      "Clear",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Divider(),
                    FilterButtonItemBuild(
                      onTap: () {},
                      title: "Brand",
                    ),
                    Divider(),
                    FilterButtonItemBuild(
                      onTap: () {},
                      title: "Season",
                    ),
                    Divider(),
                    FilterButtonItemBuild(
                      onTap: () {},
                      title: "Color",
                    ),
                    Divider(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> addDressModalBottomSheetBuild(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: deviceHeight(context) * 0.9,
          decoration: modalBottomSheetBoxDecoration,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:
                            Text("Cancel", style: TextStyle(fontSize: 12.sp))),
                    Text("Add Clothes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp)),
                    Text(
                      "+Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Container(
                          height: deviceHeight(context) * 0.25,
                          decoration: BoxDecoration(
                              color: secColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: textFromFieldShadow),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.camera_alt,
                                        size: 10.w,
                                        color: iconColor,
                                      ),
                                      Text("  or  "),
                                      Icon(
                                        Icons.photo_library,
                                        size: 10.w,
                                        color: iconColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  photoUpdatedDescriptionText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 8.sp),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      textFromFieldBuild("Tittle"),
                      textFromFieldBuild("Link"),
                      textFromFieldBuild("Brand"),
                      textFromFieldBuild("Price"),
                      ToggleButtons(
                          onPressed: (index) {
                            setState(() {
                              for (int i = 0; i < isSelected.length; i++) {
                                if (i == index) {
                                  isSelected[i] = !isSelected[i];
                                }
                              }
                            });
                          },
                          children: [
                            CustomSeasonItemButton(
                              buttonTitle: "Summer",
                              isSelected: isSelected[0],
                            ),
                            CustomSeasonItemButton(
                              buttonTitle: "Fall",
                              isSelected: isSelected[1],
                            ),
                            CustomSeasonItemButton(
                              buttonTitle: "Winter",
                              isSelected: isSelected[2],
                            ),
                            CustomSeasonItemButton(
                              buttonTitle: "Spring",
                              isSelected: isSelected[3],
                            )
                          ],
                          renderBorder: false,
                          fillColor: Colors.transparent,
                          isSelected: isSelected),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                        child: Text(
                          "Rating",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: textColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RatingBar(
                          itemSize: 7.w,
                          ratingWidget: RatingWidget(
                              empty: Icon(
                                Icons.favorite,
                                color: favoriteIconColor,
                              ),
                              full: Icon(
                                Icons.favorite,
                                color: primaryColor,
                              ),
                              half: Icon(
                                Icons.favorite,
                              )),
                          onRatingUpdate: (value) {
                            print(value);
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showModalCupertinoPickerBuild(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
            decoration: modalBottomSheetBoxDecoration,
            height: deviceHeight(context) * 0.3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text("Cancel",
                              style: TextStyle(fontSize: 12.sp))),
                      Text(
                        "Short",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      Text(
                        "Choose",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 6.w,
                        onSelectedItemChanged: (val) {},
                        children: [
                          Text("En Yüksek Favori"),
                          Text("En Düşük Favori")
                        ]),
                  ),
                ],
              ),
            ));
      },
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
