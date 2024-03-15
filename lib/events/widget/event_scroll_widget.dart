import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../constants/app_sizes.dart';
import '../constants/event_app_colors.dart';

class EventScrollWidget extends StatelessWidget {
  const EventScrollWidget({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            surfaceTintColor: EventAppColors.whiteColor,
            elevation: 0,
            backgroundColor: innerBoxIsScrolled
                ? EventAppColors.whiteColor
                : EventAppColors.whiteColor,
            automaticallyImplyLeading: false,
            expandedHeight: 270.h,
            floating: true,
            toolbarHeight: 55.h,
            flexibleSpace: _scrollableWidget(context),
            actions: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalScreen20pxPaddingPhone),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            child: _headerWidget(context),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
            pinned: true,
            snap: false,
            primary: true,
            shadowColor: Colors.white,
          ),
        ];
      },
      body: body!,
    );
  }

  _headerWidget(context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          const Icon(Icons.arrow_back_ios_new_outlined),
          const SizedBoxWidget(
            width: 10,
          ),
          Textwidget(
            text: "कालवड सौंदर्य स्पर्धा",
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }

  _scrollableWidget(context) {
    return Padding(
        padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Textwidget(
            text: "महाराष्ट्रात प्रथमच कालवडींसाठी सौंदर्य स्पर्धा",
            fontSize: 17.sp,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/event_icon/bull.svg',
                width: 120,
                height: 120,
              ),
              const SizedBoxWidget(
                width: 15,
              ),
              Expanded(
                child: Textwidget(
                  text:
                      "स्पर्धेबरोबरच दैनंदिन शेतीतील अलीकडच्या प्रगतीवर एक दिवसीय परिषद होणार असून तेथे तज्ञ पशुवैद्य शेतकऱ्यांना मार्गदर्शन करतील",
                  fontSize: 13.sp,
                  color: EventAppColors.subtitleTextColor,
                ),
              ),
            ],
          ),
          const SizedBoxWidget(
            height: 10,
          ),
          const Divider(),
          const DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: "Tab 1"),
                    Tab(text: "Tab 2"),
                    Tab(text: "Tab 3"),
                  ],
                ),
              ],
            ),
          ),
        ])));
  }
}
