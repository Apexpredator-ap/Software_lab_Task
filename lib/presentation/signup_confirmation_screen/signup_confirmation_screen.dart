import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import 'controller/signup_confirmation_controller.dart';

// ignore_for_file: must_be_immutable
class SignupConfirmationScreen extends GetWidget<SignupConfirmationController> {
  const SignupConfirmationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(
            left: 33.h,
            top: 184.v,
            right: 33.h,
          ),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgVectorGreenA700,
                height: 80.v,
                width: 120.h,
              ),
              SizedBox(height: 34.v),
              Text(
                "msg_you_re_all_done".tr,
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 24.v),
              SizedBox(
                width: 323.h,
                child: Text(
                  "msg_hang_tight_we".tr,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildSignupConfirmationButton(),
      ),
    );
  }

  /// Section Widget
  Widget _buildSignupConfirmationButton() {
    return CustomElevatedButton(
      text: "lbl_got_it".tr,
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 54.v,
      ),
    );
  }
}
