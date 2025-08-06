import 'package:chat_gpt_app/features/auth/data/repos_impl/login_repo_impl.dart';
import 'package:chat_gpt_app/features/auth/data/repos_impl/signup_repo_impl.dart';
import 'package:chat_gpt_app/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:chat_gpt_app/features/auth/presentation/manager/login_using_google%20cubit/login_using_google_cubit.dart';
import 'package:chat_gpt_app/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:chat_gpt_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatgptApp extends StatelessWidget {
  const ChatgptApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(LoginRepoImpl()),),
        BlocProvider(create: (context) => SignupCubit(SignupRepoImpl())),
         BlocProvider(create: (context) => LoginUsingGoogleCubit(LoginRepoImpl()),),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginView()),
    );
  }
}
