import 'package:bloc/bloc.dart';
import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/signup_entity.dart';
import 'package:chat_gpt_app/features/auth/domain/repos/signup_repo.dart';

import 'package:dartz/dartz.dart';
part 'sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(SignupInitial());

  Future<void> signupUsingEmailandPassword(SignupEntity user) async {
    emit(SignupLoading());

    final Either<Failure, void> result =
        await signupRepo.signupUsingEmailandPassword(user);

    result.fold(
      (failure) => emit(SignupFailure(failure.message)),
      (_) => emit(SignupSuccess()),
    );
  }
}
