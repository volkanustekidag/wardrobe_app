import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/pages/combine_detail_page/combine_detail.dart';
import 'package:wardrobe_app/pages/make_combine_page.dart/make_combine_pages.dart';

class CombinePage extends StatefulWidget {
  const CombinePage({Key key}) : super(key: key);

  @override
  State<CombinePage> createState() => _CombinePageState();
}

class _CombinePageState extends State<CombinePage> {
  List<String> pathList = [
    "assets/dress.png",
    "assets/dress2.png",
    "assets/dress4.png",
    "assets/dress3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MakeCombinePage()));
          },
          label: Row(
            children: [Icon(Icons.add), Text("Add Combine")],
          )),
      body: Column(
        children: [
          Container(
              height: deviceHeight(context) * 0.08,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  height: deviceHeight(context) * 0.07,
                  child: TextFormField(
                      onChanged: (text) {},
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xffD0D0D2),
                        ),
                        hintText: "Search Combine",
                        hintStyle: TextStyle(
                            color: Colors.black12, fontWeight: FontWeight.w400),
                        border: InputBorder.none,
                      )),
                ),
              )),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    height: deviceHeight(context) * 0.25,
                    color: secColor,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CombineDetailPage()));
                      },
                      child: Hero(
                        tag: index,
                        child: Column(
                          children: [
                            Flexible(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Image.asset(
                                      pathList[index],
                                      width: 25.w,
                                    ),
                                  );
                                },
                              ),
                            ),
                            DefaultTextStyle(
                              style: TextStyle(),
                              child: Text(
                                "My Summer Collection",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
