import 'package:flutter/material.dart';
import 'package:wardrobe_app/models/menu_item.dart';

class MenuItems {
  static List<PopupMenuButtonItem> itemsFirst = [itemDelete, itemEdit];

  static const itemDelete =
      PopupMenuButtonItem(title: "Delete", iconData: Icons.delete);
  static const itemEdit =
      PopupMenuButtonItem(title: "Edit", iconData: Icons.edit);
}
