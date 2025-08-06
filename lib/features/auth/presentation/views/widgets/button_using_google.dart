import 'package:chat_gpt_app/core/utils/widgets/show_custom_snackbar.dart';
import 'package:chat_gpt_app/features/auth/presentation/manager/login_using_google%20cubit/login_using_google_cubit.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_button_header.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/widgets/custom_text_button.dart';
import 'package:chat_gpt_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonUsingGoogle extends StatelessWidget {
  const ButtonUsingGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUsingGoogleCubit, LoginUsingGoogleState>(
      listener: (context, state) {
        if (state is LoginUsingGoogleSuccess) {
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
        } else if (state is LoginUsingGoolgeFailure) {
          showCustomSnackBar(
            context: context,
            message: state.error,
            isSuccess: false,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginUsingGoogleLoading;

        return isLoading
            ? const CircularProgressIndicator(color: Colors.grey)
            : CustomTextButton(
                ontap: () {
                  context.read<LoginUsingGoogleCubit>().loginWithGoogle();
                },
                child: CustomButtonHeader(
                  iconurl: 'assets/images/search.png',
                  text: 'Continue with Google',
                ),
              );
      },
    );
  }
}
