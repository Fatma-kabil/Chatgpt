import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class CustomFormField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  const CustomFormField({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: CustomTextField(
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
    );
  }
}
