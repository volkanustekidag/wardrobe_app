import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/data/icon_asset_items.dart';
import 'package:wardrobe_app/pages/catogery_item_page/category_item_details_page.dart';
import 'package:sizer/sizer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Widget> catogeryIconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateCatogeryIconList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        return GestureDetector(
                          onTap: () {
                            buildModalBottomSheetAddCategory(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CategoryItemDetailsPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border:
                                      Border.all(color: primaryColor, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Align(
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Expanded(
                                              flex: 2,
                                              child: SvgPicture.asset(
                                                IconAssetItems
                                                    .svgCategoryList[index - 1],
                                                width: 50,
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1,
                                                child: CircleAvatar(
                                                  maxRadius: 6,
                                                  backgroundColor: primaryColor,
                                                )),
                                          ],
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Dress",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    }))),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildModalBottomSheetAddCategory(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: modalBottomSheetBoxDecoration,
          height: deviceHeight(context) * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:
                            Text("Cancel", style: TextStyle(fontSize: 12.sp))),
                    Text(
                      "Add Category",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(
                      "+Add",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12.sp),
                    ),
                  ],
                ),
                Spacer(),
                Expanded(child: textFromFieldBuild("Category Name")),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Select a icon category\n",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: textColor),
                          textAlign: TextAlign.right,
                        ))),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: deviceHeight(context) * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: secColor,
                      boxShadow: textFromFieldShadow,
                    ),
                    child: GridView.count(
                      crossAxisCount: 5,
                      padding: EdgeInsets.all(15),
                      children: List.generate(
                          IconAssetItems.svgCategoryList.length,
                          (index) => GestureDetector(
                              onTap: () {
                                _generateCatogeryIconList();
                                setState(() {
                                  catogeryIconList[index] = CategoryItem(
                                    index: index,
                                    isSelected: true,
                                  );
                                });
                              },
                              child: catogeryIconList[index])),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  _generateCatogeryIconList() {
    catogeryIconList =
        List.generate(IconAssetItems.svgCategoryList.length, (index) {
      return CategoryItem(
        index: index,
        isSelected: false,
      );
    });
  }
}

class CategoryItem extends StatelessWidget {
  final isSelected;
  final index;
  const CategoryItem({Key key, this.isSelected, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: !isSelected
              ? BoxDecoration()
              : BoxDecoration(
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(IconAssetItems.svgCategoryList[index]),
          )),
    );
  }
}
