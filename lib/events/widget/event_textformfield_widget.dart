import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbo/events/constants/event_app_colors.dart';

import '../../constants/app_colors.dart';

class EventTextformFieldWidget extends StatefulWidget {
  const EventTextformFieldWidget(
      {super.key,
      this.hintText,
      this.height,
      this.rouneded = 12,
      this.fontWeight = FontWeight.normal,
      this.focusNode,
      this.suffixIcon,
      this.isSuffixIconShow = false,
      this.isRounded = true,
      this.backgroundColor = EventAppColors.textformFieldColor,
      this.controller,
      this.textInputType,
      this.inputFormater,
      this.onChanged,
      this.initialValue,
      this.isBorderColor = true,
      this.isEditable = true,
      this.hintTextColor = AppColors.blackColor,
      this.fontSize,
      this.suffixIconClick,
      this.width,
      this.maxLength});

  final String? initialValue;
  final bool isSuffixIconShow;
  final String? hintText;
  final int? maxLength;
  final double? height;
  final double? width;
  final double rouneded;
  final bool isRounded;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final FocusNode? focusNode;
  final String? suffixIcon;
  final VoidCallback? suffixIconClick;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final Function(String)? onChanged;
  final bool isEditable;

  @override
  State<EventTextformFieldWidget> createState() =>
      _EventTextformFieldWidgetState();
}

class _EventTextformFieldWidgetState extends State<EventTextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            widget.isRounded ? BorderRadius.circular(widget.rouneded) : null,
      ),
      height: widget.height,
      width: widget.width,
      child: TextFormField(
          enabled: widget.isEditable,
          maxLength: widget.maxLength ?? null,
          initialValue: widget.initialValue,
          cursorColor: Colors.black,
          inputFormatters: widget.inputFormater,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          style: GoogleFonts.kumbhSans(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: Theme.of(context).secondaryHeaderColor),
          decoration: InputDecoration(
              suffix: widget.isSuffixIconShow
                  ? InkWell(
                      onTap: widget.suffixIconClick,
                      child: Padding(
                        padding: EdgeInsets.only(top: 25.h),
                        child: SvgPicture.asset(
                          widget.suffixIcon ?? "",
                          height: 20.h,
                          width: 20.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const SizedBox(),
              contentPadding: EdgeInsets.all(12.h),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.kumbhSans(
                  fontSize: widget.fontSize,
                  fontWeight: widget.fontWeight,
                  color: EventAppColors.hintTextColor),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rouneded),
                  borderSide: BorderSide(
                      width: 1.w,
                      color: (widget.isBorderColor ?? false)
                          ? EventAppColors.appbarBackgroundColor
                          : EventAppColors.appbarBackgroundColor)),
              focusedBorder: widget.isRounded
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.rouneded),
                      borderSide: BorderSide(
                          width: 1.w,
                          color: (widget.isBorderColor ?? false)
                              ? EventAppColors.appbarBackgroundColor
                              : EventAppColors.appbarBackgroundColor))
                  : null,
              border: widget.isRounded
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.rouneded),
                      borderSide: BorderSide(
                          width: 1.w,
                          color: (widget.isBorderColor ?? false)
                              ? EventAppColors.appbarBackgroundColor
                              : EventAppColors.appbarBackgroundColor))
                  : null)),
    );
  }
}
