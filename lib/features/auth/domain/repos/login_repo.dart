import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity_using_google.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failure,void>> logInUsingEmailandPassword(LoginEntity user);
   Future<Either<Failure, LoginEntityUsingGoogle>> loginWithGoogle();
}
