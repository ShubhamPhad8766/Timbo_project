// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/widgets/text_widget.dart';

class QuantityWidget extends StatefulWidget {
  QuantityWidget(
      {Key? key,
      this.quantity = 0,
      this.showQtyText = true,
      this.width = 100,
      required this.onIncrementQuantity,
      required this.onDecrementQuantity})
      : super(key: key);
  int quantity;
  final bool? showQtyText;
  final double width;
  final void Function(int) onIncrementQuantity;
  final void Function(int) onDecrementQuantity;
  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if ((widget.showQtyText ?? false)) ...{
          Textwidget(
            text: AppStrings.quantity,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.medium14pxTextSize,
          ),
          SizedBox(
            width: 12.w,
          ),
        },
        Container(
          width: AppSizes.setWidth(widget.width),
          height: AppSizes.setHeight(0.04),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12.r)),
          child: Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () => decreaseValue(),
                    icon: Icon(
                      size: 8.h,
                      FontAwesomeIcons.minus,
                      color: Colors.black,
                    )),
              ),
              Textwidget(
                text: widget.quantity.toString(),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () => incrementValue(),
                    icon: Icon(
                      FontAwesomeIcons.plus,
                      size: 8.h,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void incrementValue() {
    setState(() {
      widget.quantity++;
    });

    widget.onIncrementQuantity(widget.quantity);
  }

  void decreaseValue() {
    if (widget.quantity > 1) {
      setState(() {
        widget.quantity--;
      });

      widget.onIncrementQuantity(widget.quantity);
    }
  }
}
