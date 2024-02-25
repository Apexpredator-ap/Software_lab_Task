import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/login_reset_password_screen/models/login_reset_password_model.dart';
import 'package:flutter/material.dart';
import 'package:sample_test/data/models/resetPassword/post_reset_password_resp.dart';
import 'package:sample_test/data/apiClient/api_client.dart';

/// A controller class for the LoginResetPasswordScreen.
///
/// This class manages the state of the LoginResetPasswordScreen, including the
/// current loginResetPasswordModelObj
class LoginResetPasswordController extends GetxController {
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordController1 = TextEditingController();

  Rx<LoginResetPasswordModel> loginResetPasswordModelObj =
      LoginResetPasswordModel().obs;

  PostResetPasswordResp postResetPasswordResp = PostResetPasswordResp();

  @override
  void onClose() {
    super.onClose();
    newpasswordController.dispose();
    newpasswordController1.dispose();
  }

  /// Calls the https://sowlab.pw/assignment/user/reset-password API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callResetPassword(Map req) async {
    try {
      postResetPasswordResp =
          await Get.find<ApiClient>().resetPassword(requestData: req);
      _handleResetPasswordSuccess();
    } on PostResetPasswordResp catch (e) {
      postResetPasswordResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleResetPasswordSuccess() {}
}
