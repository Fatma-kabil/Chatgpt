import 'package:chat_gpt_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class ChatgptApp extends StatelessWidget {
  const ChatgptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),

    )
    ;
  }
}
