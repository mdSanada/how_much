import 'package:flutter/material.dart';

class TabItem {
  TabItem({
    required this.icon,
    this.status,
  });

  UniqueKey? id = UniqueKey();
  IconData icon;
  late bool? status;

  static List<TabItem> tabItemsList = [
    TabItem(icon: Icons.home_filled),
    TabItem(icon: Icons.handyman),
    TabItem(icon: Icons.settings),
  ];
}
