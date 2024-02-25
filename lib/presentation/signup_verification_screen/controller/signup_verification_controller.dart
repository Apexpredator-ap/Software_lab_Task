import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/signup_verification_screen/models/signup_verification_model.dart';

/// A controller class for the SignupVerificationScreen.
///
/// This class manages the state of the SignupVerificationScreen, including the
/// current signupVerificationModelObj
class SignupVerificationController extends GetxController {
  Rx<SignupVerificationModel> signupVerificationModelObj =
      SignupVerificationModel().obs;
}
