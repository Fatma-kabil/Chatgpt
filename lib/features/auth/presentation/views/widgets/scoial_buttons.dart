import 'package:flutter/material.dart';
import 'custom_button_header.dart';
import 'custom_text_button.dart';
import '../../../data/models/social_button_data.dart';

class SocialLoginButtons extends StatelessWidget {
  final List<SocialButtonData> buttons;

  const SocialLoginButtons({super.key, required this.buttons,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: buttons.map((button) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: CustomTextButton(
          ontap: button.onTap,
          child: CustomButtonHeader(
            iconurl: button.iconPath,
            text: button.text,
          ),
        ),
      )).toList(),
    );
  }
}
