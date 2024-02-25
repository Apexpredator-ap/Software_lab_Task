import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/core/utils/validation_functions.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import 'package:sample_test/widgets/custom_text_form_field.dart';
import 'controller/signup_controller.dart';
import 'package:sample_test/domain/googleauth/google_auth_helper.dart';
import 'package:sample_test/domain/facebookauth/facebook_auth_helper.dart';
import 'package:sample_test/data/models/registerDeviceAuth/post_register_device_auth_req.dart';
import 'package:sample_test/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends GetWidget<SignupController> {
  SignupScreen({Key? key}) : super(key: key);

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
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_farmereats".tr,
                                      style: theme.textTheme.bodyLarge)),
                              SizedBox(height: 32.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_signup_1_of_4".tr,
                                      style: theme.textTheme.titleSmall)),
                              SizedBox(height: 2.v),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("lbl_welcome".tr,
                                      style: theme.textTheme.headlineLarge)),
                              SizedBox(height: 37.v),
                              _buildLoginSection(),
                              SizedBox(height: 33.v),
                              Text("lbl_or_signup_with".tr,
                                  style: theme.textTheme.labelMedium),
                              SizedBox(height: 30.v),
                              _buildFullNameSection(),
                              SizedBox(height: 24.v),
                              _buildEmailSection(),
                              SizedBox(height: 24.v),
                              _buildPhoneNumberSection(),
                              SizedBox(height: 24.v),
                              _buildPasswordSection(),
                              SizedBox(height: 24.v),
                              _buildConfirmPasswordSection(),
                              SizedBox(height: 69.v),
                              _buildContinueButtonSection(),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  Widget _buildLoginSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: appTheme.black900.withOpacity(0.08), width: 1.h),
              borderRadius: BorderRadiusStyle.circleBorder26),
          child: Container(
              height: 52.v,
              width: 96.h,
              padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 12.v),
              decoration: AppDecoration.outlineBlack900
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
              child: Stack(alignment: Alignment.centerRight, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgGoogle,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                    alignment: Alignment.center,
                    onTap: () {
                      onTapImgGoogle();
                    }),
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgVector,
                                  height: 9.v,
                                  width: 19.h),
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: 15.v,
                                      width: 23.h,
                                      child: Stack(
                                          alignment: Alignment.topRight,
                                          children: [
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgMobile,
                                                height: 9.v,
                                                width: 19.h,
                                                alignment:
                                                    Alignment.bottomLeft),
                                            CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgArrowLeft,
                                                height: 11.v,
                                                width: 12.h,
                                                alignment: Alignment.topRight)
                                          ])))
                            ])))
              ]))),
      Container(
          height: 52.v,
          width: 96.h,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 10.v),
          decoration: AppDecoration.outlineBlack900
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
          child: CustomImageView(
              imagePath: ImageConstant.imgIcons8AppleLogo,
              height: 30.adaptSize,
              width: 30.adaptSize,
              alignment: Alignment.center)),
      Container(
          height: 52.v,
          width: 96.h,
          padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 10.v),
          decoration: AppDecoration.outlineBlack900
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
          child: CustomImageView(
              imagePath: ImageConstant.imgFacebookSecondarycontainer,
              height: 30.adaptSize,
              width: 30.adaptSize,
              alignment: Alignment.center,
              onTap: () {
                onTapImgFacebook();
              }))
    ]);
  }

  /// Section Widget
  Widget _buildFullNameSection() {
    return CustomTextFormField(
        controller: controller.fullNameSectionController,
        hintText: "lbl_full_name".tr,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 15.adaptSize,
                width: 15.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildEmailSection() {
    return CustomTextFormField(
        controller: controller.emailSectionController,
        hintText: "lbl_email_address".tr,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgClock,
                height: 15.adaptSize,
                width: 15.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildPhoneNumberSection() {
    return CustomTextFormField(
        controller: controller.phoneNumberSectionController,
        hintText: "lbl_phone_number".tr,
        textInputType: TextInputType.phone,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCall,
                height: 15.adaptSize,
                width: 15.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        validator: (value) {
          if (!isValidPhone(value)) {
            return "err_msg_please_enter_valid_phone_number".tr;
          }
          return null;
        });
  }

  /// Section Widget
  Widget _buildPasswordSection() {
    return CustomTextFormField(
        controller: controller.passwordSectionController,
        hintText: "lbl_password".tr,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 14.v, 10.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 19.v,
                width: 15.h)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: true);
  }

  /// Section Widget
  Widget _buildConfirmPasswordSection() {
    return CustomTextFormField(
        controller: controller.confirmPasswordSectionController,
        hintText: "msg_re_enter_password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(16.h, 14.v, 10.h, 14.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLocation,
                height: 19.v,
                width: 15.h)),
        prefixConstraints: BoxConstraints(maxHeight: 48.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: true);
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
        width: 226.h,
        text: "lbl_continue".tr,
        onPressed: () {
          signUp();
        });
  }

  /// Section Widget
  Widget _buildContinueButtonSection() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: EdgeInsets.only(top: 18.v, bottom: 12.v),
          child: Text("lbl_login".tr,
              style: CustomTextStyles.bodyMediumBlack900
                  .copyWith(decoration: TextDecoration.underline))),
      _buildContinue()
    ]);
  }

  onTapImgGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapImgFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  /// calls the [https://sowlab.pw/assignment/user/register] API
  ///
  /// It has [PostRegisterDeviceAuthReq] as a parameter which will be passed as a API request body
  /// If the call is successful, the function calls the `_onSignUpSuccess()` function.
  /// If the call fails, the function calls the `_onSignUpError()` function.
  ///
  /// Throws a `NoInternetException` if there is no internet connection.
  Future<void> signUp() async {
    PostRegisterDeviceAuthReq postRegisterDeviceAuthReq =
        PostRegisterDeviceAuthReq();
    try {
      await controller.callRegisterDeviceAuth(
        postRegisterDeviceAuthReq.toJson(),
      );
      _onSignUpSuccess();
    } on PostRegisterDeviceAuthResp {
      _onSignUpError();
    } on NoInternetException catch (e) {
      Get.rawSnackbar(message: e.toString());
    } catch (e) {
      //TODO: Handle generic errors
    }
  }

  void _onSignUpSuccess() {}
  void _onSignUpError() {}
}
