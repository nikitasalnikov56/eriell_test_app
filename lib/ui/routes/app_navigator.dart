import 'package:eriell_app/ui/pages/auth_check/auth_check.dart';
import 'package:eriell_app/ui/pages/home_page/home_page.dart';
import 'package:eriell_app/ui/routes/app_routes.dart';
import 'package:go_router/go_router.dart';


abstract class AppNavigator {
  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.auth,
        builder: (context, state) => const AuthCheck(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );
  static GoRouter get router => _router;
}
