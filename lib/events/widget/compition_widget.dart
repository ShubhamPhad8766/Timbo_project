import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../constants/event_app_colors.dart';

class CompitionWidget extends StatelessWidget {
  const CompitionWidget(
      {super.key,
      this.height = 80,
      this.width = 85,
      this.text,
      this.icon,
      this.borderRadius,
      this.image,
      this.imageWidth,
      this.textSize = 14,
      this.imageHeight, this.onPress});

  final double height;
  final double width;
  final double? textSize;
  final String? text;
  final Icon? icon;
  final double? borderRadius;
  final SvgPicture? image;
  final double? imageWidth;
  final double? imageHeight;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: EventAppColors.containerColor,
          borderRadius: BorderRadius.circular(
              borderRadius ?? 22), // Adjust the radius value as needed
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8), // Adjust padding as needed
                child: SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: image,
                )),
            Textwidget(
              text: text,
              fontWeight: FontWeight.bold,
              fontSize: textSize?.sp,
            )
          ],
        ),
      ),
    );
  }
}
