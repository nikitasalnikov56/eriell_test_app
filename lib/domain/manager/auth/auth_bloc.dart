import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:eriell_app/domain/database/hive_box.dart';
import 'package:eriell_app/domain/database/hive_data.dart';
import 'package:meta/meta.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    
    on<SignUpEvent>(_onSignUp);
     on<SignInEvent>(_onSignIn);
     on<CheckAuthEvent>(_onCheckAuth);
  }


  

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async{
    final hashedPassword = sha256.convert(utf8.encode(event.password)).toString();
    final user = HiveData(
      userName: event.userName,
      userEmail: event.userEmail,
      password: hashedPassword,
      isAuthenticated: true,
    );

    final box = HiveBoxes.data;
    await box.put(event.userEmail, user);
    emit(Authenticated());
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async{
     final box = HiveBoxes.data;
    final user = box.get(event.userEmail);

    if (user != null) {
      final hashedPassword = sha256.convert(utf8.encode(event.password)).toString();
      if (user.password == hashedPassword) {
        user.isAuthenticated = true;
        await box.put(event.userEmail, user);
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } else {
      emit(Unauthenticated());
    }
  }


   void _onCheckAuth(CheckAuthEvent event, Emitter<AuthState> emit) async {
    final box = HiveBoxes.data;
    final users = box.values;

    for (var user in users) {
      if (user.isAuthenticated == true) {
        emit(Authenticated());
        return;
      }
    }
    emit(Unauthenticated());
  }
}
