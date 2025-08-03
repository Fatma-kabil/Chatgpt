import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,

    required this.ontap,
    required this.child,
    this.color,
  });

  final Widget child;
  final Color? color;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        
        decoration: BoxDecoration(
        
          border: Border.all(),
          borderRadius: BorderRadius.circular(30),
          color: color ?? Colors.white,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
