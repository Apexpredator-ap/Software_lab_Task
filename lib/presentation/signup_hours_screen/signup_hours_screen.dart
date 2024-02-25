import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/widgets/custom_elevated_button.dart';
import '../signup_hours_screen/widgets/chipviewfortyeight_item_widget.dart';
import '../signup_hours_screen/widgets/chipviewfortyfour_item_widget.dart';
import 'controller/signup_hours_controller.dart';
import 'models/chipviewfortyeight_item_model.dart';
import 'models/chipviewfortyfour_item_model.dart';

// ignore_for_file: must_be_immutable
class SignupHoursScreen extends GetWidget<SignupHoursController> {
  const SignupHoursScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
                "lbl_signup_4_of_4".tr,
                style: theme.textTheme.titleSmall,
              ),
              SizedBox(height: 5.v),
              Text(
                "lbl_business_hours".tr,
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 24.v),
              Container(
                width: 314.h,
                margin: EdgeInsets.only(right: 15.h),
                child: Text(
                  "msg_choose_the_hours".tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 36.v),
              _buildChipViewFortyFour(),
              SizedBox(height: 30.v),
              _buildChipViewFortyEight(),
              Spacer(),
              SizedBox(height: 16.v),
              _buildRowFiftyTwo(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChipViewFortyFour() {
    return Obx(
      () => Wrap(
        runSpacing: 12.v,
        spacing: 12.h,
        children: List<Widget>.generate(
          controller
              .signupHoursModelObj.value.chipviewfortyfourItemList.value.length,
          (index) {
            ChipviewfortyfourItemModel model = controller.signupHoursModelObj
                .value.chipviewfortyfourItemList.value[index];

            return ChipviewfortyfourItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildChipViewFortyEight() {
    return Obx(
      () => Wrap(
        runSpacing: 10.v,
        spacing: 10.h,
        children: List<Widget>.generate(
          controller.signupHoursModelObj.value.chipviewfortyeightItemList.value
              .length,
          (index) {
            ChipviewfortyeightItemModel model = controller.signupHoursModelObj
                .value.chipviewfortyeightItemList.value[index];

            return ChipviewfortyeightItemWidget(
              model,
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowFiftyTwo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgArrowDown,
          height: 18.v,
          width: 26.h,
          margin: EdgeInsets.symmetric(vertical: 17.v),
        ),
        CustomElevatedButton(
          width: 226.h,
          text: "lbl_signup".tr,
        ),
      ],
    );
  }
}
