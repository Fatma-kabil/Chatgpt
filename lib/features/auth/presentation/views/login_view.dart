import 'package:chat_gpt_app/features/auth/data/models/social_button_data.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
   LoginView({super.key});
  final socialButtons = [
  SocialButtonData(
    iconPath: 'assets/images/search.png',
    text: 'Continue with Google',
    onTap: () => print('Google login'),
  ),
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
      body: LoginViewBody(socialButtons: socialButtons),
    );
  }
}
