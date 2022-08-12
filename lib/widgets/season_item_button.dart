import 'package:flutter/material.dart';
import 'package:wardrobe_app/constants/colors.dart';

class CustomSeasonItemButton extends StatefulWidget {
  final isSelected;
  final buttonTitle;
  const CustomSeasonItemButton({Key key, this.buttonTitle, this.isSelected})
      : super(key: key);

  @override
  State<CustomSeasonItemButton> createState() => _CustomSeasonItemButtonState();
}

class _CustomSeasonItemButtonState extends State<CustomSeasonItemButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor, width: 1),
              color: widget.isSelected ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            widget.buttonTitle,
            style: TextStyle(
                color: widget.isSelected ? Colors.white : primaryColor),
          )),
    );
  }
}
