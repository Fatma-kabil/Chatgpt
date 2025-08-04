import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/core/services/firebase_services.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity.dart';
import 'package:chat_gpt_app/features/auth/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImpl extends LoginRepo {
  final FirebaseAuth _auth = FirebaseServices.auth;



  @override
  Future<Either<Failure, void>> logInUsingEmailandPassword(
    LoginEntity user,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return right(null); // يعني العملية نجحت
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(e.message ?? 'Login failed'));
    } catch (e) {
      return left(UnexpectedFailure(e.toString()));
    }
  }
}
