// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../constants/app_sizes.dart';
import 'custom_circular_progress_indicator.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      this.onPress,
      this.inProgress,
      this.buttonText,
      this.color,
      this.buttonTextSize,
      this.borderRadius = 5.0});

  final VoidCallback? onPress;
  final bool? inProgress;
  final String? buttonText;
  final double borderRadius;
  final MaterialStateProperty<Color?>? color;
  double? buttonTextSize = AppSizes.large16pxTextSize;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPress,
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius))),
          backgroundColor: widget.color ?? 
              MaterialStatePropertyAll(Theme.of(context).secondaryHeaderColor),
          minimumSize: MaterialStatePropertyAll(
              Size(AppSizes.setWidth(100), AppSizes.height(45)))),
      child: (widget.inProgress ?? false)
          ? const CustomCircularProgressIndidator()
          : Textwidget(
              text: widget.buttonText,
              fontSize: widget.buttonTextSize,
              color: Theme.of(context).primaryColor,
            ),
    );
  }
}
