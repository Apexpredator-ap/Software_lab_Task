import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/core/utils/validation_functions.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import 'package:sample_test/widgets/custom_text_form_field.dart';
import 'controller/login_forgot_password_controller.dart';
import 'package:sample_test/data/models/forgotPasswordPost/post_forgot_password_post_req.dart';
import 'package:sample_test/data/models/forgotPasswordPost/post_forgot_password_post_resp.dart';

// ignore_for_file: must_be_immutable
class LoginForgotPasswordScreen
    extends GetWidget<LoginForgotPasswordController> {
  LoginForgotPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30.h, vertical: 37.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_farmereats".tr,
                                      style: theme.textTheme.bodyLarge),
                                  SizedBox(height: 93.v),
                                  Text("msg_forgot_password".tr,
                                      style: theme.textTheme.headlineLarge),
                                  SizedBox(height: 20.v),
                                  RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "msg_remember_your_pasword2".tr,
                                            style: CustomTextStyles
                                                .titleSmall4c000000),
                                        TextSpan(
                                            text: "lbl".tr,
                                            style: CustomTextStyles
                                                .titleSmall4c000000),
                                        TextSpan(
                                            text: "lbl_login".tr,
                                            style: CustomTextStyles
                                                .titleSmallffd5715b)
                                      ]),
                                      textAlign: TextAlign.left),
                                  SizedBox(height: 68.v),
                                  CustomTextFormField(
                                      controller:
                                          controller.phoneNumberController,
                                      hintText: "lbl_phone_number".tr,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.phone,
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              16.h, 16.v, 10.h, 16.v),
                                          child: CustomImageView(
                                              imagePath: ImageConstant.imgCall,
                                              height: 15.adaptSize,
                                              width: 15.adaptSize)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 48.v),
                                      validator: (value) {
                                        if (!isValidPhone(value)) {
                                          return "err_msg_please_enter_valid_phone_number"
                                              .tr;
                                        }
                                        return null;
                                      }),
                                  SizedBox(height: 32.v),
                                  CustomElevatedButton(
                                      text: "lbl_send_code".tr,
                                      onPressed: () {
                                        callApi();
                                      }),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// calls the [https://sowlab.pw/assignment/user/forgot-password] API
  ///
  /// It has [PostForgotPasswordPostReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onCallApiSuccess()` function.
  /// If the call fails, the function calls the `_onCallApiError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> callApi() async {
    PostForgotPasswordPostReq postForgotPasswordPostReq =
        PostForgotPasswordPostReq();
    try {
      await controller.callForgotPasswordPost(
        postForgotPasswordPostReq.toJson(),
      );
      _onCallApiSuccess();
    } on PostForgotPasswordPostResp {
      _onCallApiError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onCallApiSuccess() {}
  void _onCallApiError() {}
}
