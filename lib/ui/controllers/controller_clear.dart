import 'package:eriell_app/ui/controllers/app_controllers.dart';

abstract class ControllerClear{
  static controllerClear(){
    AppControllers.nameController.clear();
    AppControllers.emailController.clear();
    AppControllers.passwordController.clear();
  }
}