import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:sizer/sizer.dart';

class CategoryItemDetailsPage extends StatefulWidget {
  const CategoryItemDetailsPage({Key key}) : super(key: key);

  @override
  State<CategoryItemDetailsPage> createState() =>
      _CategoryItemDetailsPageState();
}

class _CategoryItemDetailsPageState extends State<CategoryItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Dresses"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_control_sharp))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Icon(Icons.add)),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: deviceHeight(context) * 0.07,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      onPressed: () {},
                      icon: Row(
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.white,
                          ),
                          Expanded(
                              child: Text(
                            "Filter",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
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
                      onPressed: () {},
                      icon: Row(
                        children: [
                          Icon(
                            Icons.swap_horiz_outlined,
                            color: Colors.white,
                          ),
                          Expanded(
                              child: Text(
                            "Short",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
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
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      decoration: BoxDecoration(
                          color: secColor,
                          borderRadius: BorderRadius.circular(20)),
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
}
