import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/login_forgot_password_screen/models/login_forgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:sample_test/data/models/forgotPasswordPost/post_forgot_password_post_resp.dart';
import 'package:sample_test/data/apiClient/api_client.dart';

/// A controller class for the LoginForgotPasswordScreen.
///
/// This class manages the state of the LoginForgotPasswordScreen, including the
/// current loginForgotPasswordModelObj
class LoginForgotPasswordController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();

  Rx<LoginForgotPasswordModel> loginForgotPasswordModelObj =
      LoginForgotPasswordModel().obs;

  PostForgotPasswordPostResp postForgotPasswordPostResp =
      PostForgotPasswordPostResp();

  @override
  void onClose() {
    super.onClose();
    phoneNumberController.dispose();
  }

  /// Calls the https://sowlab.pw/assignment/user/forgot-password API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callForgotPasswordPost(Map req) async {
    try {
      postForgotPasswordPostResp =
          await Get.find<ApiClient>().forgotPasswordPost(requestData: req);
      _handleForgotPasswordPostSuccess();
    } on PostForgotPasswordPostResp catch (e) {
      postForgotPasswordPostResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleForgotPasswordPostSuccess() {}
}
