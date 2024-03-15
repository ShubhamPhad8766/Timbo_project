import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/events/widget/event_textformfield_widget.dart';
import 'package:timbo/events/widget/scaffold_widget.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';

import '../../../utils/routes/routes.dart';
import '../../../widgets/text_widget.dart';
import '../../constants/event_app_colors.dart';
import '../../constants/event_app_strings.dart';

class BookStallScreen extends StatefulWidget {
  const BookStallScreen({super.key});

  @override
  State<BookStallScreen> createState() => _BookStallScreenState();
}

class _BookStallScreenState extends State<BookStallScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ScaffoldWidget(
        homeIcon: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  _imageWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  _infoWidget(),
                  SizedBox(
                    height: 40.h,
                  ),
                  _buttonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _imageWidget() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/event_image/logo.png',
            height: 200.h,
          ),
          Textwidget(
            text: EventAppStrings.digitalPartnerText,
            fontSize: 12.sp,
          ),
          Textwidget(
            text: EventAppStrings.companyText,
            fontSize: 23.sp,
            fontWeight: FontWeight.bold,
            color: EventAppColors.companyTextColor,
          )
        ],
      ),
    );
  }

  _infoWidget() {
    return const Column(
      children: [
        EventTextformFieldWidget(
          hintText: 'Company Name',
        ),
        SizedBoxWidget(
          height: 10,
        ),
        EventTextformFieldWidget(
          hintText: 'Shop Name',
        ),
        SizedBoxWidget(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            EventTextformFieldWidget(
              hintText: 'Contact',
              width: 150,
            ),
            EventTextformFieldWidget(
              hintText: 'Size',
              width: 130,
            ),
          ],
        ),
        SizedBoxWidget(
          height: 10,
        ),
        EventTextformFieldWidget(
          hintText: 'Bussness Type',
        ),
        SizedBoxWidget(
          height: 10,
        ),
        EventTextformFieldWidget(
          hintText: 'Product Description',
          maxLength: 5,
        ),
      ],
    );
  }

  _buttonWidget() {
    return Center(
      child: Container(
          height: 40.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: EventAppColors.registerButtonColor,
            borderRadius:
                BorderRadius.circular(32), // Adjust the radius value as needed
          ),
          child: TextButton(
              onPressed: () {
                context.push(Routes.gatepassScreen);
              },
              child: const Text('Book'))),
    );
  }
}
