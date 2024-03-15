import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timbo/events/presentations/home_screen/event_home_screen.dart';
import 'package:timbo/events/widget/sizedbox_widget.dart';
import 'package:timbo/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/event_app_colors.dart';

class ScaffoldWidget extends StatelessWidget {
  ScaffoldWidget(
      {super.key,
      required this.child,
      this.text,
      this.homeIcon = false,
      this.isOnHomeScreen = false});

  final Widget child;
  final String? text;
  final bool? homeIcon;
  final bool isOnHomeScreen;
  final String url =
      'https://www.google.com/maps/place/The+baap+company/@19.6518947,74.2556444,17z/data=!3m1!4b1!4m6!3m5!1s0x3bdc554bf31a3115:0x550e3ccf3b2fd70e!8m2!3d19.6518897!4d74.2582193!16s%2Fg%2F11rv0b8tdz?entry=ttu';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffECF7BF), Color(0xff6F9101)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(children: [child, if (homeIcon!) _homeButton(context)]),
        ),
      ),
    );
  }

  // ignore: unused_element
  _homeButton(context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (!isOnHomeScreen) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const EventHomeScreen())));
                  }
                },
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: EventAppColors
                          .containerColor // Change the color of the circular container as needed
                      ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/event_icon/home.svg',
                      width: 17,
                      height: 17,
                    ),
                  ),
                ),
              ),
              const SizedBoxWidget(
                width: 10,
              ),
              if (text != null)
                Textwidget(
                  text: text,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
            ],
          ),
          InkWell(
            onTap: () {
              launch(url);
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: EventAppColors
                      .containerColor // Change the color of the circular container as needed
                  ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/event_icon/location.svg',
                  width: 17,
                  height: 17,
                  color: EventAppColors.greenColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
