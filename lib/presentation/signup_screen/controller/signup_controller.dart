import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/signup_screen/models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:sample_test/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:sample_test/data/apiClient/api_client.dart';

/// A controller class for the SignupScreen.
///
/// This class manages the state of the SignupScreen, including the
/// current signupModelObj
class SignupController extends GetxController {
  TextEditingController fullNameSectionController = TextEditingController();

  TextEditingController emailSectionController = TextEditingController();

  TextEditingController phoneNumberSectionController = TextEditingController();

  TextEditingController passwordSectionController = TextEditingController();

  TextEditingController confirmPasswordSectionController =
      TextEditingController();

  Rx<SignupModel> signupModelObj = SignupModel().obs;

  PostRegisterDeviceAuthResp postRegisterDeviceAuthResp =
      PostRegisterDeviceAuthResp();

  @override
  void onClose() {
    super.onClose();
    fullNameSectionController.dispose();
    emailSectionController.dispose();
    phoneNumberSectionController.dispose();
    passwordSectionController.dispose();
    confirmPasswordSectionController.dispose();
  }

  /// Calls the https://sowlab.pw/assignment/user/register API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callRegisterDeviceAuth(Map req) async {
    try {
      postRegisterDeviceAuthResp =
          await Get.find<ApiClient>().registerDeviceAuth(
        headers: {
          'Content-Type': 'application/json',
        },
        requestData: req,
      );
      _handleRegisterDeviceAuthSuccess();
    } on PostRegisterDeviceAuthResp catch (e) {
      postRegisterDeviceAuthResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleRegisterDeviceAuthSuccess() {}
}
