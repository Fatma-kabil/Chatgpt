import 'package:chat_gpt_app/core/utils/widgets/show_custom_snackbar.dart';
import 'package:chat_gpt_app/features/auth/data/models/social_button_data.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/signup_entity.dart';
import 'package:chat_gpt_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/scoial_buttons.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/signup_form_field.dart';
import 'package:chat_gpt_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  showCustomSnackBar(
                    context: context,
                    message: 'Account created successfully ✅',
                    isSuccess: true,
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeView();
                        },
                      ),
                    );
                  });
                } else if (state is SignupFailure) {
                  showCustomSnackBar(
                    context: context,
                    message: state.error,
                    isSuccess: false,
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state is SignupLoading;

                return isLoading
                    ? const CircularProgressIndicator(color: Colors.grey)
                    : CustomTextButton(
                        ontap: () {
                          if (formKey.currentState!.validate()) {
                            final user = SignupEntity(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            );

                            context
                                .read<SignupCubit>()
                                .signupUsingEmailandPassword(user);
                          }
                        },
                        color: Colors.black,
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      );
              },
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
