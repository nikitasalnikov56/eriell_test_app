part of 'page_change_bloc.dart';

@immutable
sealed class PageChangeEvent {}

 class AuthPageChangeEvent extends PageChangeEvent {
  final bool isSignUp;
   AuthPageChangeEvent({required this.isSignUp});
}