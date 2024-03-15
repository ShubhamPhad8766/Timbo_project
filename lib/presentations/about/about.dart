import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/utils/routes/routes.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../widgets/text_widget.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: systemOverLayStyle,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Textwidget(
          fontSize: 18.sp,
          text: AppStrings.about,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
        child: Column(
          children: [
            profileMenu(() {
              context.push(Routes.privacyPolicy);
            }, FontAwesomeIcons.buildingShield, AppStrings.privacyPolicy,
                FontAwesomeIcons.chevronRight),
            profileMenu(() {
              context.push(Routes.cancellationAndRefundPolicy);
            },
                FontAwesomeIcons.solidMoneyBill1,
                AppStrings.cancellationRefundPolicy,
                FontAwesomeIcons.chevronRight),
            profileMenu(() {
              context.push(Routes.contactUsScreen);
            }, FontAwesomeIcons.phone, AppStrings.contactsUs,
                FontAwesomeIcons.chevronRight),
            profileMenu(() {
              context.push(Routes.aboutUsScreen);
            }, FontAwesomeIcons.user, AppStrings.aboutUs,
                FontAwesomeIcons.chevronRight),
            profileMenu(() {
              context.push(Routes.privacyDeleteAccount);
            }, FontAwesomeIcons.user, AppStrings.deleteAccount,
                FontAwesomeIcons.chevronRight),
          ],
        ),
      ),
    );
  }

  Widget profileMenu(
      Function ontap, IconData icon, String text, IconData trailingIcon) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8.r)),
          width: AppSizes.setHeight(100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(AppSizes.verticalScreen12pxPaddingPhone),
                child: Icon(icon,
                    color: Theme.of(context).secondaryHeaderColor, size: 16.h),
              ),
              SizedBox(
                width: 10.w,
              ),
              Textwidget(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(trailingIcon,
                    color: Theme.of(context).secondaryHeaderColor, size: 15.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
