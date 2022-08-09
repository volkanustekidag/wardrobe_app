import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/pages/combine_detail_page/combine_detail_page.dart';
import 'package:wardrobe_app/pages/make_combine_page/make_combine_pages.dart';

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

  final ScrollController scrollcontroller = new ScrollController();
  bool scrollVisibility = true;

  @override
  void initState() {
    scrollcontroller.addListener(() {
      if (scrollcontroller.position.pixels > 0) {
        setState(() {
          scrollVisibility = false;
        });
        print(scrollcontroller.position.pixels);
        print(scrollcontroller.position.maxScrollExtent);
      } else {
        print(scrollVisibility);
        setState(() {
          scrollVisibility = true;
        });
      }
    });
    super.initState();
  }

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Combines",
          style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 20.sp),
        ),
      ),
      body: Column(
        children: [
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: scrollVisibility ? 1 : 0,
            child: Visibility(
              visible: scrollVisibility,
              child: Container(
                  height: deviceHeight(context) * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: textFromFieldShadow,
                          borderRadius: BorderRadius.circular(10)),
                      height: deviceHeight(context) * 0.07,
                      child: TextFormField(
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            prefixIcon: Icon(
                              Icons.search,
                              color: primaryColor,
                            ),
                            hintText: "Search Combine",
                            hintStyle: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w400),
                            border: InputBorder.none,
                          )),
                    ),
                  )),
            ),
          ),
          Flexible(
            child: ListView.builder(
              controller: scrollcontroller,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: deviceHeight(context) * 0.2,
                    decoration: BoxDecoration(
                      boxShadow: textFromFieldShadow,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CombineDetailPage()));
                      },
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "My Summer Collection",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
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
