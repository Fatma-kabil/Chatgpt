import 'package:chat_gpt_app/core/errors/failure.dart';
import 'package:chat_gpt_app/core/services/firebase_services.dart';
import 'package:chat_gpt_app/features/auth/domain/entities/signup_entity.dart';
import 'package:chat_gpt_app/features/auth/domain/repos/signup_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepoImpl extends SignupRepo {
   final FirebaseAuth _auth = FirebaseServices.auth;
  final FirebaseFirestore _firestore = FirebaseServices.firestore;

  @override
  Future<Either<Failure, void>> signupUsingEmailandPassword(
    SignupEntity user,
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      await _firestore.collection('Users').doc(credential.user!.uid).set({
        'name': user.name,
        'email': user.email,
        
      });

      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(AuthFailure(e.message ?? "Sign up failed"));
    } on FirebaseException catch (e) {
      return left(FirestoreFailure(e.message ?? "Firestore error"));
    } catch (e) {
      return left(UnexpectedFailure("Unexpected error: $e"));
    }
  }
}
