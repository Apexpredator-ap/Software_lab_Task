import 'chipviewfortyfour_item_model.dart';
import 'chipviewfortyeight_item_model.dart';
import '../../../core/app_export.dart';

/// This class defines the variables used in the [signup_hours_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class SignupHoursModel {
  Rx<List<ChipviewfortyfourItemModel>> chipviewfortyfourItemList =
      Rx(List.generate(7, (index) => ChipviewfortyfourItemModel()));

  Rx<List<ChipviewfortyeightItemModel>> chipviewfortyeightItemList =
      Rx(List.generate(5, (index) => ChipviewfortyeightItemModel()));
}
