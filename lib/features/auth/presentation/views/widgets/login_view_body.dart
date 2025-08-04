
import 'package:chat_gpt_app/features/auth/data/models/social_button_data.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/login_form_field.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/scoial_buttons.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
   LoginViewBody({
    super.key,
    required this.socialButtons,
  });

  final List<SocialButtonData> socialButtons;
   final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwoedController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            Image.asset('assets/images/fekra.png', height: 100),
            Text(
              'Welcome back',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
            ),
            SizedBox(height: 10),
            LoginFormField(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwoedController,
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
                Text("Don’t have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpView();
                        },
                      ),
                    );
                  },
                  child: Text(" Sign Up ", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomDivider(),
      
            SizedBox(height: 20),
            SocialLoginButtons(buttons: socialButtons,),
      
          ],
        ),
      ),
    );
  }
}
