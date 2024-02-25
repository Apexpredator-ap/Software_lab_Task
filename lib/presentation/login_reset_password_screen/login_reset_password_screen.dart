import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/core/utils/validation_functions.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import 'package:sample_test/widgets/custom_text_form_field.dart';
import 'controller/login_reset_password_controller.dart';
import 'package:sample_test/data/models/resetPassword/post_reset_password_req.dart';
import 'package:sample_test/data/models/resetPassword/post_reset_password_resp.dart';

// ignore_for_file: must_be_immutable
class LoginResetPasswordScreen extends GetWidget<LoginResetPasswordController> {
  LoginResetPasswordScreen({Key? key}) : super(key: key);

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
                                  SizedBox(height: 90.v),
                                  Text("lbl_reset_password".tr,
                                      style: theme.textTheme.headlineLarge),
                                  SizedBox(height: 24.v),
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
                                          controller.newpasswordController,
                                      hintText: "lbl_new_password".tr,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              16.h, 14.v, 10.h, 14.v),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgLocation,
                                              height: 19.v,
                                              width: 15.h)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 48.v),
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidPassword(value,
                                                isRequired: true))) {
                                          return "err_msg_please_enter_valid_password"
                                              .tr;
                                        }
                                        return null;
                                      },
                                      obscureText: true),
                                  SizedBox(height: 24.v),
                                  CustomTextFormField(
                                      controller:
                                          controller.newpasswordController1,
                                      hintText: "msg_confirm_new_password".tr,
                                      textInputAction: TextInputAction.done,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      prefix: Container(
                                          margin: EdgeInsets.fromLTRB(
                                              16.h, 14.v, 10.h, 14.v),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgLocation,
                                              height: 19.v,
                                              width: 15.h)),
                                      prefixConstraints:
                                          BoxConstraints(maxHeight: 48.v),
                                      validator: (value) {
                                        if (value == null ||
                                            (!isValidPassword(value,
                                                isRequired: true))) {
                                          return "err_msg_please_enter_valid_password"
                                              .tr;
                                        }
                                        return null;
                                      },
                                      obscureText: true),
                                  SizedBox(height: 32.v),
                                  CustomElevatedButton(
                                      text: "lbl_submit".tr,
                                      onPressed: () {
                                        resetPswd();
                                      }),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// calls the [https://sowlab.pw/assignment/user/reset-password] API
  ///
  /// It has [PostResetPasswordReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onResetPswdSuccess()` function.
  /// If the call fails, the function calls the `_onResetPswdError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> resetPswd() async {
    PostResetPasswordReq postResetPasswordReq = PostResetPasswordReq();
    try {
      await controller.callResetPassword(
        postResetPasswordReq.toJson(),
      );
      _onResetPswdSuccess();
    } on PostResetPasswordResp {
      _onResetPswdError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onResetPswdSuccess() {}
  void _onResetPswdError() {}
}
