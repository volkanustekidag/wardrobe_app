import 'package:flutter/material.dart';
import 'package:wardrobe_app/models/menu_item.dart';

class MenuItems {
  static List<MenuItem> itemsFirst = [itemDelete, itemEdit];

  static const itemDelete = MenuItem(title: "Delete", iconData: Icons.delete);
  static const itemEdit = MenuItem(title: "Edit", iconData: Icons.edit);
}
