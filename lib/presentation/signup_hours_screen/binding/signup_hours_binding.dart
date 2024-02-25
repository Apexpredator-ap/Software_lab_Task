import '../controller/signup_hours_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupHoursScreen.
///
/// This class ensures that the SignupHoursController is created when the
/// SignupHoursScreen is first loaded.
class SignupHoursBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupHoursController());
  }
}
