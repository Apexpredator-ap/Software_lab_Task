import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/signup_hours_screen/models/signup_hours_model.dart';

/// A controller class for the SignupHoursScreen.
///
/// This class manages the state of the SignupHoursScreen, including the
/// current signupHoursModelObj
class SignupHoursController extends GetxController {
  Rx<SignupHoursModel> signupHoursModelObj = SignupHoursModel().obs;
}
