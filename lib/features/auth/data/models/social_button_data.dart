import 'package:flutter/material.dart';

class SocialButtonData {
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  SocialButtonData({
    required this.iconPath,
    required this.text,
    required this.onTap,
  });
}
