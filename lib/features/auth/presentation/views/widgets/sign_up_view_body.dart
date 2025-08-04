import 'package:chat_gpt_app/features/auth/data/models/social_button_data.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/scoial_buttons.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/signup_form_field.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key, required this.socialButtons});

  final List<SocialButtonData> socialButtons;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset('assets/images/fekra.png', height: 100),
            Text(
              'Create an account',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            SizedBox(height: 10),
            SignupFormField(
              nameController: nameController,
              passwordController: passwordController,
              formKey: formKey,
              emailController: emailController,
            ),
            SizedBox(height: 20),
            CustomTextButton(
              ontap: () {
                if (formKey.currentState!.validate()) {
                  print('Email is valid: ${emailController.text}');

                }
              },
              color: Colors.black,
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginView();
                        },
                      ),
                    );
                  },
                  child: Text(" Log in", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomDivider(),

            SizedBox(height: 20),
            SocialLoginButtons(buttons: socialButtons),
          ],
        ),
      ),
    );
  }
}
