import 'package:eriell_app/ui/routes/app_navigator.dart';
import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppNavigator.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
