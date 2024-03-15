// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../../constants/event_app_colors.dart';
import '../../constants/event_app_strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../logic/calf_competition/calf_competition_cubit.dart';
import '../../logic/cow_registration/cow_register_cubit.dart';
import '../../widget/compition_widget.dart';
import '../../widget/scaffold_widget.dart';
import '../../widget/sizedbox_widget.dart';

class EventHomeScreen extends StatefulWidget {
  const EventHomeScreen({super.key});

  @override
  State<EventHomeScreen> createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      homeIcon: true,
      isOnHomeScreen: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              _imageWidget(),
              SizedBox(
                height: 10.h,
              ),
              _dateTimeWidget(context),
              SizedBox(
                height: 15.h,
              ),
              _infoWidget(),
              SizedBox(
                height: 15.h,
              ),
              _compitionWidget(),
              SizedBox(
                height: 20.h,
              ),
              _buttonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _imageWidget() {
    return Column(
      children: [
        Image.asset(
          'assets/event_image/logo.png',
          height: 230.h,
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

  _dateTimeWidget(context) {
    return Container(
      height: 90.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: EventAppColors.containerColor,
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius value as needed
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Textwidget(
                text: EventAppStrings.dateText,
              ),
              Textwidget(
                text: '11 ते 15',
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
              Textwidget(
                text: 'जानेवारी 2024',
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Textwidget(
                text: EventAppStrings.timeText,
              ),
              Textwidget(
                text: 'सकाळी 9:00 ते ',
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
              Textwidget(
                text: 'संध्याकाळी 9:00',
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Textwidget(
                text: EventAppStrings.gatePassText,
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/event_icon/calendar.svg',
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }

  _infoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Textwidget(
          text: 'प्रदर्शना बद्दल …',
          fontSize: 14.sp,
        ),
        const SizedBox(
          height: 5,
        ),
        Textwidget(
          text: EventAppStrings.infoText,
          fontSize: 13.sp,
        )
      ],
    );
  }

  _compitionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Textwidget(
          text: 'लोकप्रिय स्पर्धा …',
          fontSize: 14.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CompitionWidget(
                text: "दूध स्पर्धा ",
                image: SvgPicture.asset(
                  'assets/event_icon/cow.svg',
                ),
                imageHeight: 35.h,
                onPress: () {
                  context.read<CowRegisterCubit>().emit(CowRegisterLoading());
                  context.push(Routes.cowRegistrationScreen);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const CowEventRegistrationSCreen()));
                },
              ),
              const SizedBoxWidget(
                width: 5,
              ),
              CompitionWidget(
                text: "सौंदर्य स्पर्धा",
                textSize: 13,
                image: SvgPicture.asset(
                  'assets/event_icon/calf.svg',
                ),
                imageHeight: 35.h,
                onPress: () {
                  context
                      .read<CalfCompetitionCubit>()
                      .emit(CalfCompetitionLoading());
                  context.push(Routes.calfRegistrationScreen);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             const EventRegistrationScreen()));
                },
              ),
              const SizedBoxWidget(
                width: 5,
              ),
              CompitionWidget(
                text: "मिल्किंग स्पर्धा",
                image: SvgPicture.asset(
                  'assets/event_icon/bucket.svg',
                ),
                imageHeight: 35.h,
              ),
              const SizedBoxWidget(
                width: 5,
              ),
              CompitionWidget(
                text: "मिल्किंग स्पर्धा",
                image: SvgPicture.asset(
                  'assets/event_icon/bucket.svg',
                ),
                imageHeight: 35.h,
              ),
              // const SizedBoxWidget(
              //   width: 5,
              // ),
              // CompitionWidget(
              //   text: "सौंदर्य स्पर्धा",
              //   textSize: 10,
              //   image: SvgPicture.asset(
              //     'assets/event_icon/calf.svg',
              //   ),
              //   imageHeight: 30.h,
              // ),
            ],
          ),
        )
      ],
    );
  }

  _buttonWidget() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.push(Routes.bookStallScreen);
          },
          child: Container(
            height: 40.h,
            width: 140.w,
            decoration: BoxDecoration(
              color: EventAppColors.containerButtonColor,
              borderRadius: BorderRadius.circular(
                  32), // Adjust the radius value as needed
            ),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/event_icon/stall.svg',
                    ),
                    SizedBoxWidget(width: 10.w),
                    Textwidget(
                      text: 'Book a Stall',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )),
          ),
        ),
        const SizedBoxWidget(
          width: 10,
        ),
        InkWell(
          onTap: () {
            context.push(Routes.eventRegistrationScreen);
          },
          child: Container(
            height: 40.h,
            width: 168.w,
            decoration: BoxDecoration(
              color: EventAppColors.registerButtonColor,
              borderRadius: BorderRadius.circular(
                  32), // Adjust the radius value as needed
            ),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/event_icon/scanner.svg',
                    ),
                    SizedBoxWidget(width: 10.w),
                    Textwidget(
                      text: 'Register for Event',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
