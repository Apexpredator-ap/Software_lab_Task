import '../controller/signup_confirmation_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupConfirmationScreen.
///
/// This class ensures that the SignupConfirmationController is created when the
/// SignupConfirmationScreen is first loaded.
class SignupConfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupConfirmationController());
  }
}
