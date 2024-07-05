part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent{}




class SignUpEvent extends AuthEvent {
  final String userName;
  final String userEmail;
  final String password;

  SignUpEvent(this.userName, this.userEmail, this.password);
}

class SignInEvent extends AuthEvent {
  final String userEmail;
  final String password;

  SignInEvent(this.userEmail, this.password);
}

class CheckAuthEvent extends AuthEvent {}
