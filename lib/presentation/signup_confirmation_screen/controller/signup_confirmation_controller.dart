import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/signup_confirmation_screen/models/signup_confirmation_model.dart';

/// A controller class for the SignupConfirmationScreen.
///
/// This class manages the state of the SignupConfirmationScreen, including the
/// current signupConfirmationModelObj
class SignupConfirmationController extends GetxController {
  Rx<SignupConfirmationModel> signupConfirmationModelObj =
      SignupConfirmationModel().obs;
}
