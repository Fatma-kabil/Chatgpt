
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            //   color: Colors.grey,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('OR'),
        ),
        Expanded(
          child: Divider(
            // color: Colors.grey,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
