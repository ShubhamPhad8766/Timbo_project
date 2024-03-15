import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/events/constants/event_app_colors.dart';
import 'package:timbo/events/widget/scaffold_widget.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';

import '../../../widgets/text_widget.dart';
import '../../constants/event_app_strings.dart';

class GatepassScreen extends StatefulWidget {
  const GatepassScreen({super.key});

  @override
  State<GatepassScreen> createState() => _GatepassScreenState();
}

class _GatepassScreenState extends State<GatepassScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        homeIcon: true,
        text: 'GatePass',
        child: Padding(
          padding: const EdgeInsets.only(top: 110, left: 30, right: 30),
          child: Container(
            height: 560.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: EventAppColors.appbarBackgroundColor,
                border: Border.all(
                    width: 15, color: EventAppColors.containerBorderColor
                    )),
            child: Column(
              children: [
                _imageWidget(),
                const SizedBoxWidget(
                  height: 10,
                ),
                _infoWidget(),
              ],
            ),
          ),
        ));
  }

  _imageWidget() {
    return Column(
      children: [
        Image.asset(
          'assets/event_image/logo.png',
          height: 180.h,
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
    );
  }

  _infoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Textwidget(
            text: 'Ashish Shinde',
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
          const Textwidget(
            text: 'Sangamner',
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                height: 94.h,
                width: 74.w,
                color: EventAppColors.containerColor,
              ),
              const SizedBoxWidget(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textwidget(
                            text: 'Event Date',
                            color: EventAppColors.textGrayColor,
                          ),
                          Textwidget(
                            text: '11 to 15 Jan',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      SizedBoxWidget(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textwidget(
                            text: 'Event Time',
                            color: EventAppColors.textGrayColor,
                          ),
                          Textwidget(
                            text: '9 AM to 8 PM',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBoxWidget(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textwidget(
                        text: 'Registration Date',
                        color: EventAppColors.textGrayColor,
                      ),
                      Textwidget(
                        text: '11/01/2024 11:20 PM',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          const SizedBoxWidget(
            height: 20,
          ),
          Image.asset(
            'assets/event_image/barcode.png',
            height: 80,
          )
        ],
      ),
    );
  }
}
