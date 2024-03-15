import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/events/widget/scaffold_widget.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../../utils/preferences/local_preferences.dart';
import '../../../utils/routes/routes.dart';
import '../../constants/event_app_colors.dart';
import '../../constants/event_app_strings.dart';

class OptionScreen extends StatefulWidget {
  const OptionScreen({super.key});

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldWidget(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/event_image/logo.png'),
            Textwidget(
              text: EventAppStrings.digitalPartnerText,
              fontSize: 20.sp,
            ),
            Textwidget(
              text: EventAppStrings.companyText,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: EventAppColors.companyTextColor,
            ),
            const SizedBoxWidget(
              height: 30,
            ),
            Container(
              height: 50.h,
              width: 150.w,
              decoration: BoxDecoration(
                color: EventAppColors.registerButtonColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextButton(
                onPressed: () {
                  context.push(Routes.eventHomeScreen);
                },
                child: Textwidget(
                  text: 'पुढे चालू ठेवा',
                  color: AppColors.blackColor,
                  fontSize: 15.sp,
                ),
              ),
            ),
            const SizedBoxWidget(
              height: 30,
            ),
            Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: EventAppColors.containerButtonColor,
                borderRadius: BorderRadius.circular(32),
              ),
              child: TextButton(
                onPressed: () async {
                  var user = await LocalStorage.fetchToken();
                  if (user?.isNotEmpty ?? false) {
                    context.push(Routes.homeScreen);
                  } else {
                    // context.pushReplacement(Routes.optionScreen);
                    context.pushReplacement(Routes.verifyNumberScreen);
                  }
                  // context.pushReplacement(Routes.verifyNumberScreen);
                },
                child: const Textwidget(
                  text: 'Skip करा',
                  color: AppColors.blackColor,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
