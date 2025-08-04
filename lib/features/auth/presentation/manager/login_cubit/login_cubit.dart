import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity.dart';
import 'package:chat_gpt_app/features/auth/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(LoginInitial());

  Future<void> logInUsingEmailandPassword(LoginEntity user) async {
    emit(LoginLoading());

    final Either<Failure, void> result =
        await loginRepo.logInUsingEmailandPassword(user);

    result.fold(
      (failure) => emit(LoginFailure(errMessage:  failure.message )),
      (_) => emit(LoginSuccess()),
    );
  }
}
