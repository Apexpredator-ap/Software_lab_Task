import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/core/utils/validation_functions.dart';
import 'package:sample_test/widgets/custom_drop_down.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import 'package:sample_test/widgets/custom_text_form_field.dart';
import 'controller/signup_farm_info_controller.dart';

// ignore_for_file: must_be_immutable
class SignupFarmInfoScreen extends GetWidget<SignupFarmInfoController> {
  SignupFarmInfoScreen({Key? key})
      : super(
          key: key,
        );

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
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 30.h,
                  vertical: 37.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "lbl_farmereats".tr,
                      style: theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 32.v),
                    Text(
                      "lbl_signup_2_of_4".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 3.v),
                    Text(
                      "lbl_farm_info".tr,
                      style: theme.textTheme.headlineLarge,
                    ),
                    SizedBox(height: 37.v),
                    _buildFarmerEats(),
                    SizedBox(height: 24.v),
                    _buildSignupOfFour(),
                    SizedBox(height: 24.v),
                    _buildFarmInfo(),
                    SizedBox(height: 24.v),
                    _buildName(),
                    SizedBox(height: 24.v),
                    _buildFortyNine1(),
                    Spacer(),
                    SizedBox(height: 16.v),
                    _buildFiftyOne(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFarmerEats() {
    return CustomTextFormField(
      controller: controller.farmerEatsController,
      hintText: "lbl_business_name".tr,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgSort,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 48.v,
      ),
      validator: (value) {
        if (!isText(value)) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildSignupOfFour() {
    return CustomTextFormField(
      controller: controller.signupOfFourController,
      hintText: "lbl_informal_name".tr,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgSettings,
          height: 15.adaptSize,
          width: 15.adaptSize,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 48.v,
      ),
      validator: (value) {
        if (!isText(value)) {
          return "err_msg_please_enter_valid_text".tr;
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildFarmInfo() {
    return CustomTextFormField(
      controller: controller.farmInfoController,
      hintText: "lbl_street_address".tr,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 16.v, 10.h, 16.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgHome,
          height: 16.v,
          width: 15.h,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 48.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildName() {
    return CustomTextFormField(
      controller: controller.nameController,
      hintText: "lbl_city".tr,
      prefix: Container(
        margin: EdgeInsets.fromLTRB(16.h, 15.v, 10.h, 14.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgLinkedin,
          height: 18.v,
          width: 15.h,
        ),
      ),
      prefixConstraints: BoxConstraints(
        maxHeight: 48.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyNine() {
    return CustomTextFormField(
      width: 188.h,
      controller: controller.fortyNineController,
      hintText: "lbl_enter_zipcode".tr,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.number,
      validator: (value) {
        if (!isNumeric(value)) {
          return "err_msg_please_enter_valid_number".tr;
        }
        return null;
      },
      contentPadding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 13.v,
      ),
    );
  }

  /// Section Widget
  Widget _buildFortyNine1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDropDown(
          width: 126.h,
          icon: Container(
            margin: EdgeInsets.fromLTRB(30.h, 17.v, 16.h, 17.v),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                1.h,
              ),
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgFavorite,
              height: 13.v,
              width: 19.h,
            ),
          ),
          hintText: "lbl_state".tr,
          items:
              controller.signupFarmInfoModelObj.value.dropdownItemList!.value,
          onChanged: (value) {
            controller.onSelected(value);
          },
        ),
        _buildFortyNine(),
      ],
    );
  }

  /// Section Widget
  Widget _buildContinue() {
    return CustomElevatedButton(
      width: 226.h,
      text: "lbl_continue".tr,
    );
  }

  /// Section Widget
  Widget _buildFiftyOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgArrowDown,
          height: 18.v,
          width: 26.h,
          margin: EdgeInsets.symmetric(vertical: 17.v),
        ),
        _buildContinue(),
      ],
    );
  }
}
