part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class Authenticated extends AuthState {}
class Unauthenticated extends AuthState {}
