import 'package:eriell_app/domain/manager/auth/auth_bloc.dart';
import 'package:eriell_app/ui/pages/auth_page/auth_page.dart';
import 'package:eriell_app/ui/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(CheckAuthEvent()),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const HomePage();
          }
          if (state is Unauthenticated) {
            return const AuthPage();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
