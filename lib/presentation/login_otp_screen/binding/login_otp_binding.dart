import '../controller/login_otp_controller.dart';
import 'package:get/get.dart';

/// A binding class for the LoginOtpScreen.
///
/// This class ensures that the LoginOtpController is created when the
/// LoginOtpScreen is first loaded.
class LoginOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginOtpController());
  }
}
