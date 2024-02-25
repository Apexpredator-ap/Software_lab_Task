import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import '../models/chipviewfortyfour_item_model.dart';

// ignore: must_be_immutable
class ChipviewfortyfourItemWidget extends StatelessWidget {
  ChipviewfortyfourItemWidget(
    this.chipviewfortyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipviewfortyfourItemModel chipviewfortyfourItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 11.h,
          vertical: 6.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewfortyfourItemModelObj.m!.value,
          style: TextStyle(
            color: (chipviewfortyfourItemModelObj.isSelected?.value ?? false)
                ? appTheme.whiteA700
                : theme.colorScheme.primaryContainer.withOpacity(0.3),
            fontSize: 16.fSize,
            fontFamily: 'Be Vietnam',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (chipviewfortyfourItemModelObj.isSelected?.value ?? false),
        backgroundColor: appTheme.whiteA700,
        selectedColor: theme.colorScheme.primary,
        shape: (chipviewfortyfourItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: theme.colorScheme.primaryContainer.withOpacity(0.3),
                  width: 1.h,
                ),
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
        onSelected: (value) {
          chipviewfortyfourItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
