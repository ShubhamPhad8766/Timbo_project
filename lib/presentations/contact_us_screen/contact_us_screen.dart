import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
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
            text: AppStrings.contactsUs,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textwidget(
                    fontSize: AppSizes.large16pxTextSize,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.justify,
                    text: AppStrings.baapExperiencesPvtLtd,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Textwidget(
                        fontSize: AppSizes.medium14pxTextSize,
                        textAlign: TextAlign.justify,
                        fontWeight: FontWeight.w600,
                        text: "${AppStrings.email} : ",
                      ),
                      Textwidget(
                        fontSize: AppSizes.medium14pxTextSize,
                        textAlign: TextAlign.justify,
                        text: "experiences@baapcompany.com",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Textwidget(
                        fontSize: AppSizes.medium14pxTextSize,
                        textAlign: TextAlign.justify,
                        fontWeight: FontWeight.w600,
                        text: "Phone Number-  : ",
                      ),
                      Textwidget(
                        fontSize: AppSizes.medium14pxTextSize,
                        textAlign: TextAlign.justify,
                        text: "9105838485",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Textwidget(
                    fontSize: AppSizes.medium14pxTextSize,
                    textAlign: TextAlign.justify,
                    text: """211/3, Paregaon Khurd, Post- Nannaj Dumala, 
Tal- Sangamner, Dist- Ahmednagar - 422611 """,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
