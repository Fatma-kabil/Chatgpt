import 'package:chat_gpt_app/core/utils/widgets/show_custom_snackbar.dart';
import 'package:chat_gpt_app/features/auth/data/models/social_button_data.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity.dart';
import 'package:chat_gpt_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/login_form_field.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/scoial_buttons.dart';
import 'package:chat_gpt_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key, required this.socialButtons});

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

            // ✅ Login Form Field
            LoginFormField(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwoedController,
            ),

            SizedBox(height: 20),

            // ✅ BlocConsumer
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  showCustomSnackBar(
                    context: context,
                    message: 'Logged in successfully ✅',
                    isSuccess: true,
                  );
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  });
                } else if (state is LoginFailure) {
                  showCustomSnackBar(
                    context: context,
                    message: state.errMessage,
                    isSuccess: false,
                  );
                }
              },
              builder: (context, state) {
                final isLoading = state is LoginLoading;

                return isLoading
                    ? const CircularProgressIndicator(color: Colors.grey)
                    : CustomTextButton(
                        ontap: () {
                          if (formKey.currentState!.validate()) {
                            final user = LoginEntity(
                              email: emailController.text,
                              password: passwoedController.text,
                            );
                            context
                                .read<LoginCubit>()
                                .logInUsingEmailandPassword(user);
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
                Text("Don’t have an account?"),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpView()),
                    );
                  },
                  child: Text(
                    " Sign Up ",
                    style: TextStyle(color: Colors.blue),
                  ),
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
