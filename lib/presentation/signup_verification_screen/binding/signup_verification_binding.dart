import '../controller/signup_verification_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupVerificationScreen.
///
/// This class ensures that the SignupVerificationController is created when the
/// SignupVerificationScreen is first loaded.
class SignupVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupVerificationController());
  }
}
