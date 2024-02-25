import '../controller/signup_farm_info_controller.dart';
import 'package:get/get.dart';

/// A binding class for the SignupFarmInfoScreen.
///
/// This class ensures that the SignupFarmInfoController is created when the
/// SignupFarmInfoScreen is first loaded.
class SignupFarmInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupFarmInfoController());
  }
}
