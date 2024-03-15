import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          systemOverlayStyle: systemOverLayStyle,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Textwidget(
            fontSize: 18.sp,
            text: AppStrings.aboutUs,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: Scrollbar(
          thickness: 4.0,
          thumbVisibility: true,
          radius: Radius.circular(15.r),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalScreen20pxPaddingPhone),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "BAAP Experience Centre is India’s Agri Inputs Marketplace Platform providing a wide choice of quality inputs to farmers at their doorstep.",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.small12pxTextSize,
                    textAlign: TextAlign.justify,
                    text:
                        "BAAP experience is bringing accessibility of quality agricultural products and personalized advisory by leveraging its Technology offering for farmer empowerment.",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
