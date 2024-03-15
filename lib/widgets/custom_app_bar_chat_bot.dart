import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/widgets/text_widget.dart';

class CustomAppbarChatBot extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomAppbarChatBot({super.key});

  @override
  State<CustomAppbarChatBot> createState() => _CustomAppbarChatBotState();

  @override
  Size get preferredSize => Size(100.sw, 60.h);
}

class _CustomAppbarChatBotState extends State<CustomAppbarChatBot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Textwidget(
            text: "Welcome Sathish,",
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
          SizedBox(
            height: 10.h,
          ),
          Textwidget(
            text: "This is the bot to help to get what you want !",
            fontWeight: FontWeight.normal,
            fontSize: 14.sp,
          )
        ],
      ),
    );
  }
}
