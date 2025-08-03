import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool enabled;

  const CustomTextField({
    super.key,
    required this.label,
    this.validator,
    this.controller,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      enabled: enabled,
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.blue),

        labelText: label,
       
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black), // ✅ أزرق في حالة التفعيل
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue), // رمادي لو مش مفعّل
          borderRadius: BorderRadius.circular(12),
        ),
         focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, ),
          borderRadius: BorderRadius.circular(12),
        ),
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
