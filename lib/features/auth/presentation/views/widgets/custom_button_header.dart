
import 'package:flutter/material.dart';

class CustomButtonHeader extends StatelessWidget {
  const CustomButtonHeader({super.key, required this.iconurl, required this.text});

  final String iconurl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(iconurl, height: 25),
        SizedBox(width: 15),
        Text(text),
      ],
    );
  }
}
