// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:timbo/events/constants/event_app_colors.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../constants/app_sizes.dart';
import '../../widgets/custom_circular_progress_indicator.dart';


class CustomEventButton extends StatefulWidget {
  CustomEventButton(
      {super.key,
      this.onPress,
      this.inProgress,
      this.buttonText,
      this.buttonTextSize,
      this.buttonColor = EventAppColors.containerButtonColor ,
      this.borderRadius = 5.0, 
      required this.height,
      required this.width
      });

  final VoidCallback? onPress;
  final bool? inProgress;
  final String? buttonText;
  final double borderRadius;
  final double height;
  final double width;
  final Color buttonColor;
  double? buttonTextSize = AppSizes.large16pxTextSize;

  @override
  State<CustomEventButton> createState() => _CustomEventButtonState();
}

class _CustomEventButtonState extends State<CustomEventButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: TextButton(
        onPressed: widget.onPress,
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius))),
            backgroundColor:MaterialStatePropertyAll(widget.buttonColor),
            minimumSize: MaterialStatePropertyAll(
                Size(AppSizes.setWidth(100), AppSizes.height(45)))),
        child: (widget.inProgress ?? false)
            ? const CustomCircularProgressIndidator()
            : Textwidget(
                text: widget.buttonText,
                fontSize: widget.buttonTextSize,
                color: Theme.of(context).primaryColor,
              ),
      ),
    );
  }
}
