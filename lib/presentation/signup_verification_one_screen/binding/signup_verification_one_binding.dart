import '../controller/signup_verification_one_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupVerificationOneScreen.
///
/// This class ensures that the SignupVerificationOneController is created when the
/// SignupVerificationOneScreen is first loaded.
class SignupVerificationOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupVerificationOneController());
  }
}
