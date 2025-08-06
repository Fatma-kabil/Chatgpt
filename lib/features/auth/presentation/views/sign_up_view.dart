import 'package:chat_gpt_app/features/auth/data/models/social_button_data.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final socialButtons = [
   
    SocialButtonData(
      iconPath: 'assets/images/microsoft.png',
      text: 'Continue with Microsoft Account',
      onTap: () => print('Microsoft login'),
    ),
    SocialButtonData(
      iconPath: 'assets/images/apple.png',
      text: 'Continue with Apple',
      onTap: () => print('Apple login'),
    ),
    SocialButtonData(
      iconPath: 'assets/images/telephone.png',
      text: 'Continue with phone',
      onTap: () => print('Phone login'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SignUpViewBody(socialButtons: socialButtons),
    );
  }
}
