import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/login_otp_screen/models/login_otp_model.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:sample_test/data/models/verifyOtp/post_verify_otp_resp.dart';
import 'package:sample_test/data/apiClient/api_client.dart';

/// A controller class for the LoginOtpScreen.
///
/// This class manages the state of the LoginOtpScreen, including the
/// current loginOtpModelObj
class LoginOtpController extends GetxController with CodeAutoFill {
  Rx<TextEditingController> otpController = TextEditingController().obs;

  Rx<LoginOtpModel> loginOtpModelObj = LoginOtpModel().obs;

  PostVerifyOtpResp postVerifyOtpResp = PostVerifyOtpResp();

  @override
  void codeUpdated() {
    otpController.value.text = code ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    listenForCode();
  }

  /// Calls the https://sowlab.pw/assignment/user/verify-otp API with the specified request data.
  ///
  /// The [Map] parameter represents request body
  Future<void> callVerifyOtp(Map req) async {
    try {
      postVerifyOtpResp =
          await Get.find<ApiClient>().verifyOtp(requestData: req);
      _handleVerifyOtpSuccess();
    } on PostVerifyOtpResp catch (e) {
      postVerifyOtpResp = e;
      rethrow;
    }
  }

  /// handles the success response for the API
  void _handleVerifyOtpSuccess() {}
}
