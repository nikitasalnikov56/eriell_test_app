import 'package:eriell_app/domain/manager/auth/auth_bloc.dart';
import 'package:eriell_app/domain/manager/page_change/page_change_bloc.dart';
import 'package:eriell_app/ui/components/textfield_widget.dart';
import 'package:eriell_app/ui/controllers/app_controllers.dart';
import 'package:eriell_app/ui/controllers/controller_clear.dart';
import 'package:eriell_app/ui/style/app_colors.dart';
import 'package:eriell_app/ui/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Text(
            'Авторизация',
            textAlign: TextAlign.center,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          TextfieldWidget(
            controller: AppControllers.emailController,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 10),
          TextfieldWidget(
            controller: AppControllers.passwordController,
            labelText: 'Пароль',
            obscureText: true,
          ),
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              context.read<AuthBloc>().add(SignInEvent(
                    AppControllers.emailController.text,
                    AppControllers.passwordController.text,
                  ));
              ControllerClear.controllerClear();
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: const LinearGradient(
                  colors: [
                    AppColors.gradient1,
                    AppColors.gradient2,
                    AppColors.gradient3,
                  ],
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Text(
                  'Войти',
                  textAlign: TextAlign.center,
                  style: AppStyle.fontStyle.copyWith(
                    color: AppColors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Нет аккаунта?',
                style: AppStyle.fontStyle
                    .copyWith(color: AppColors.black, fontSize: 16),
              ),
              InkWell(
                onTap: () => context.read<PageChangeBloc>().add(
                      AuthPageChangeEvent(isSignUp: false),
                    ),
                child: Text(
                  ' Зарегистрируйтесь',
                  style: AppStyle.fontStyle.copyWith(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
