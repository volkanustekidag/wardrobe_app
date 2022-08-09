import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';
import 'package:sizer/sizer.dart';

class FilterButtonItemBuild extends StatelessWidget {
  final String title;
  final onTap;
  const FilterButtonItemBuild({
    Key key,
    this.onTap,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        child: ListTile(
          dense: true,
          leading: Text(title),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 4.w,
          ),
        ),
      ),
    );
  }
}
