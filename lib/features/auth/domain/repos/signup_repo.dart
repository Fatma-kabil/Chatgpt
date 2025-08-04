import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/signup_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepo {
  Future<Either<Failure, void>> signupUsingEmailandPassword(SignupEntity user);
}
