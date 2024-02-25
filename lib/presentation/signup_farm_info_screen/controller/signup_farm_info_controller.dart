import 'package:sample_test/core/app_export.dart';
import 'package:sample_test/presentation/signup_farm_info_screen/models/signup_farm_info_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignupFarmInfoScreen.
///
/// This class manages the state of the SignupFarmInfoScreen, including the
/// current signupFarmInfoModelObj
class SignupFarmInfoController extends GetxController {
  TextEditingController farmerEatsController = TextEditingController();

  TextEditingController signupOfFourController = TextEditingController();

  TextEditingController farmInfoController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController fortyNineController = TextEditingController();

  Rx<SignupFarmInfoModel> signupFarmInfoModelObj = SignupFarmInfoModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    farmerEatsController.dispose();
    signupOfFourController.dispose();
    farmInfoController.dispose();
    nameController.dispose();
    fortyNineController.dispose();
  }

  onSelected(dynamic value) {
    for (var element in signupFarmInfoModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    signupFarmInfoModelObj.value.dropdownItemList.refresh();
  }
}
