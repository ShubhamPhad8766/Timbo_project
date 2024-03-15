import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/widgets/textformfield_widget.dart';

import '../../../../constants/app_strings.dart';
import '../../../../widgets/custom_app_bar_chat_bot.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CustomAppbarChatBot(),
      body: Padding(
        padding: EdgeInsets.only(
            left: 15.w,
            right: 15.w,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.h),
              child: TextformFieldWidget(
                  height: 50.h,
                  hintText: AppStrings.typeNewMessage,
                  isRounded: true,
                  isSuffixIconShow: true,
                  suffixIcon: "assets/icons/icon_send.svg"),
            )
          ],
        ),
      ),
    ));
  }
}
