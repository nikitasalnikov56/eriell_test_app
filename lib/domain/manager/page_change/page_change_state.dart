part of 'page_change_bloc.dart';

@immutable
sealed class PageChangeState {}

final class PageChangeInitial extends PageChangeState {}

final class PageSignUpState extends PageChangeState {}
final class PageSignInState extends PageChangeState {}
