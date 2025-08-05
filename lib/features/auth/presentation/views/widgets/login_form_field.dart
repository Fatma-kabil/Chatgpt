import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class LoginFormField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
   final TextEditingController passwordController;

  const LoginFormField({
    super.key,
    required this.formKey,
    required this.emailController, required this.passwordController,
  });

  @override
  State<LoginFormField> createState() => _LoginFormFieldState();
}

class _LoginFormFieldState extends State<LoginFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Email address',
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 15),
          CustomTextField(
            isSecured: true,
            label: 'Password',
            controller: widget.passwordController,
        //    keyboardType: TextInputType.,
            validator:  (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Password is required';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ],
      ),
       

      
    );
  }
}
