import 'package:flutter/material.dart';
import 'package:timbo/constants/app_colors.dart';

import '../constants/app_sizes.dart';
import 'text_widget.dart';

class AddressSavedAsChipWidget extends StatefulWidget {
  const AddressSavedAsChipWidget({
    super.key,
    this.text,
    this.onTapFunction,
     this.isSelected = false,  
  });
  final String? text;
  final bool isSelected;
  final VoidCallback? onTapFunction;
  @override
  State<AddressSavedAsChipWidget> createState() =>
      _AddressSavedAsChipWidgetState();
}

class _AddressSavedAsChipWidgetState extends State<AddressSavedAsChipWidget> {
  @override
  Widget build(BuildContext context) {
    return ActionChip(
        onPressed: widget.onTapFunction,
        backgroundColor: widget.isSelected  ? AppColors.greenColor : AppColors.white,
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 0.5,
        ),
        label: Textwidget(
          text: widget.text,
          fontWeight: FontWeight.w500,
          fontSize: AppSizes.small12pxTextSize,
          color: widget.isSelected  ? AppColors.whiteColor : Theme.of(context).secondaryHeaderColor,
        ));
  }
}
