part of 'sign_up_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}


class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {}

class SignupFailure extends SignupState {
  final String error;
  SignupFailure(this.error);
}