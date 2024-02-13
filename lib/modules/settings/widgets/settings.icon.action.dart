import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsIconAction {
  final String title;
  final void Function()? onPressed;
  final IconData icon;

  SettingsIconAction({
    required this.title,
    required this.onPressed,
    required this.icon,
  });
}
