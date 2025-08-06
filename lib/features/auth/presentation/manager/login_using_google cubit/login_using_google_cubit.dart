import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity_using_google.dart';
import 'package:chat_gpt_app/features/auth/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'login_using_google_state.dart';

class LoginUsingGoogleCubit extends Cubit<LoginUsingGoogleState> {
  final LoginRepo login_repo;
  LoginUsingGoogleCubit(this.login_repo) : super(LoginUsingGoogleInitial());

  Future<void> loginWithGoogle() async {
    emit(LoginUsingGoogleLoading());

    final Either<Failure, LoginEntityUsingGoogle> result = await login_repo.loginWithGoogle ();

    result.fold(
      (failure) => emit(LoginUsingGoolgeFailure(failure.message)),
      (user) => emit(LoginUsingGoogleSuccess(user)),
    );
  }
}
