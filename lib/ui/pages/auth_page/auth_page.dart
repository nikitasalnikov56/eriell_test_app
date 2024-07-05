import 'package:eriell_app/domain/manager/page_change/page_change_bloc.dart';
import 'package:eriell_app/ui/components/custom_appbar.dart';
import 'package:eriell_app/ui/pages/signin_page/signin_page.dart';
import 'package:eriell_app/ui/pages/signup_page/signup_page.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PageChangeBloc()..add(AuthPageChangeEvent(isSignUp: false)),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        extendBodyBehindAppBar: true,
        appBar: CustomAppbar(),
        body: AuthBody(),
      ),
    );
  }
}

class AuthBody extends StatelessWidget {
  const AuthBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageChangeBloc, PageChangeState>(
      builder: (context, state) {
        if (state is PageSignUpState) {
          return const SignupPage();
        }
        if (state is PageSignInState) {
          return const SingInPage();
        }
        return const SizedBox();
      },
    );
  }
}
