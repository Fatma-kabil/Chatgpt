import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class SignupFormField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
   final TextEditingController passwordController;
    final TextEditingController nameController;

  const SignupFormField({
    super.key,
    required this.formKey,
    required this.emailController, required this.passwordController, required this.nameController,
  });

  @override
  State<SignupFormField> createState() => _SignupFormFieldState();
}

class _SignupFormFieldState extends State<SignupFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Name',
            controller: widget.nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
           const SizedBox(height: 15),
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
