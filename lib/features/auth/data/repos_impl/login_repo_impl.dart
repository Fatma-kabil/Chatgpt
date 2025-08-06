import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/core/services/firebase_services.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/login_entity_using_google.dart';
import 'package:chat_gpt_app/features/auth/domain/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth auth =FirebaseServices.auth;
  final GoogleSignIn googleSignIn=FirebaseServices.googleSignIn;

  @override
  Future<Either<Failure, void>> logInUsingEmailandPassword(
      LoginEntity user) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(e.message ?? 'Login failed'));
    } catch (e) {
      return left(UnexpectedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, LoginEntityUsingGoogle>> loginWithGoogle() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return left(AuthFailure("Google Sign-In was cancelled"));
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await auth.signInWithCredential(credential);
      final user = userCredential.user!;

      return right(LoginEntityUsingGoogle(
        name: user.displayName ?? "",
        email: user.email ?? "",
        uid: user.uid,
      ));
    } catch (e) {
      return left(UnexpectedFailure("Unexpected error: $e"));
    }
  }
}
