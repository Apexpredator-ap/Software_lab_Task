import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import 'package:sample_test/widgets/custom_pin_code_text_field.dart';
import 'controller/login_otp_controller.dart';
import 'package:sample_test/data/models/verifyOtp/post_verify_otp_req.dart';
import 'package:sample_test/data/models/verifyOtp/post_verify_otp_resp.dart';

class LoginOtpScreen extends GetWidget<LoginOtpController> {
  const LoginOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 37.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("lbl_farmereats".tr,
                          style: theme.textTheme.bodyLarge),
                      SizedBox(height: 93.v),
                      Text("lbl_verify_otp".tr,
                          style: theme.textTheme.headlineLarge),
                      SizedBox(height: 21.v),
                      RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "msg_remember_your_pasword2".tr,
                                style: CustomTextStyles.titleSmall4c000000),
                            TextSpan(
                                text: "lbl".tr,
                                style: CustomTextStyles.titleSmall4c000000),
                            TextSpan(
                                text: "lbl_login".tr,
                                style: CustomTextStyles.titleSmallffd5715b)
                          ]),
                          textAlign: TextAlign.left),
                      SizedBox(height: 68.v),
                      Obx(() => CustomPinCodeTextField(
                          context: Get.context!,
                          controller: controller.otpController.value,
                          onChanged: (value) {})),
                      SizedBox(height: 32.v),
                      CustomElevatedButton(
                          text: "lbl_submit".tr,
                          onPressed: () {
                            callAPi();
                          }),
                      SizedBox(height: 18.v),
                      Align(
                          alignment: Alignment.center,
                          child: Text("lbl_resend_code".tr,
                              style: CustomTextStyles.titleSmallBlack900
                                  .copyWith(
                                      decoration: TextDecoration.underline))),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// calls the [https://sowlab.pw/assignment/user/verify-otp] API
  ///
  /// It has [PostVerifyOtpReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onCallAPiSuccess()` function.
  /// If the call fails, the function calls the `_onCallAPiError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> callAPi() async {
    PostVerifyOtpReq postVerifyOtpReq = PostVerifyOtpReq();
    try {
      await controller.callVerifyOtp(
        postVerifyOtpReq.toJson(),
      );
      _onCallAPiSuccess();
    } on PostVerifyOtpResp {
      _onCallAPiError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onCallAPiSuccess() {}
  void _onCallAPiError() {}
}
