import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:wardrobe_app/components/textfieldform.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:wardrobe_app/constants/const.dart';
import 'package:wardrobe_app/constants/strings.dart';
import 'package:wardrobe_app/constants/styles.dart';
import 'package:wardrobe_app/repositories/api_service.dart';
import 'package:wardrobe_app/widgets/season_item_button.dart';

class AddingClothesPage extends StatefulWidget {
  const AddingClothesPage({Key key}) : super(key: key);

  @override
  State<AddingClothesPage> createState() => _AddingClothesPageState();
}

class _AddingClothesPageState extends State<AddingClothesPage> {
  List<bool> isSelected = List.generate(4, (index) => false);
  Uint8List imageFile;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Make Combine",
          style: GoogleFonts.bebasNeue(color: primaryColor, fontSize: 16.sp),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: primaryColor,
            )),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            children: [
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
                            boxShadow: widgetShadow),
                        child: imagePath != null
                            ? Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            selectCameraOrGalleryBuild(context);
                                          },
                                          icon: Icon(
                                            Icons.edit,
                                            size: 5.w,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.ac_unit,
                                            size: 5.w,
                                          ))
                                    ],
                                  ),
                                  Expanded(child: Image.memory(imageFile)),
                                ],
                              )
                            : GestureDetector(
                                onTap: () {
                                  selectCameraOrGalleryBuild(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Spacer(),
                                            Expanded(
                                                child: SvgPicture.asset(
                                              "assets/svg/camera.svg",
                                              width: 12.w,
                                            )),
                                            Text("  or  "),
                                            Expanded(
                                              child: SvgPicture.asset(
                                                "assets/svg/gallery.svg",
                                                width: 12.w,
                                              ),
                                            ),
                                            Spacer(),
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      imageFile = await ApiService().removeBgApi(imagePath);
                      setState(() {});
                    },
                    child: Text("Adding New Clothes"),
                    style: ElevatedButton.styleFrom(primary: primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectCameraOrGalleryBuild(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.camera_alt)),
              IconButton(
                  onPressed: () async {
                    await getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.photo))
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(imageSource) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: imageSource);
      if (pickedImage != null) {
        imagePath = pickedImage.path;
        imageFile = await pickedImage.readAsBytes();
        setState(() {});
      }
    } catch (e) {}
  }
}
