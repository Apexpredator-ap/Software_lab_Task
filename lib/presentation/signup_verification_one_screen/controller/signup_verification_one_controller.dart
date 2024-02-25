import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/signup_verification_one_screen/models/signup_verification_one_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignupVerificationOneScreen.
///
/// This class manages the state of the SignupVerificationOneScreen, including the
/// current signupVerificationOneModelObj
class SignupVerificationOneController extends GetxController {
  TextEditingController weburlController = TextEditingController();

  Rx<SignupVerificationOneModel> signupVerificationOneModelObj =
      SignupVerificationOneModel().obs;

  @override
  void onClose() {
    super.onClose();
    weburlController.dispose();
  }
}
