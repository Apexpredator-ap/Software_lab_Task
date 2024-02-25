import 'package:flutter/material.dart';
import 'package:sample_test/core/app_export.dart';
import '../models/chipviewfortyeight_item_model.dart';

// ignore: must_be_immutable
class ChipviewfortyeightItemWidget extends StatelessWidget {
  ChipviewfortyeightItemWidget(
    this.chipviewfortyeightItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ChipviewfortyeightItemModel chipviewfortyeightItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: EdgeInsets.symmetric(
          horizontal: 15.h,
          vertical: 13.v,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          chipviewfortyeightItemModelObj.amam!.value,
          style: TextStyle(
            color: theme.colorScheme.primaryContainer,
            fontSize: 14.fSize,
            fontFamily: 'Be Vietnam',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: (chipviewfortyeightItemModelObj.isSelected?.value ?? false),
        backgroundColor: theme.colorScheme.primaryContainer,
        selectedColor: appTheme.orange200,
        shape: (chipviewfortyeightItemModelObj.isSelected?.value ?? false)
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
        onSelected: (value) {
          chipviewfortyeightItemModelObj.isSelected!.value = value;
        },
      ),
    );
  }
}
