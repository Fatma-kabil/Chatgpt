part of 'login_using_google_cubit.dart';

@immutable
sealed class LoginUsingGoogleState {}

final class LoginUsingGoogleInitial extends LoginUsingGoogleState {}
final class LoginUsingGoogleLoading extends LoginUsingGoogleState {}

final class LoginUsingGoogleSuccess extends LoginUsingGoogleState {
  final LoginEntityUsingGoogle user;
  LoginUsingGoogleSuccess(this.user);
}

final class LoginUsingGoolgeFailure extends LoginUsingGoogleState {
  final String error;
  LoginUsingGoolgeFailure(this.error);
}