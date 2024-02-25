import '../controller/login_reset_password_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginResetPasswordScreen.
///
/// This class ensures that the LoginResetPasswordController is created when the
/// LoginResetPasswordScreen is first loaded.
class LoginResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginResetPasswordController());
  }
}
