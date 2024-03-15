import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/providers/onboard_provider.dart';
import 'package:timbo/presentations/onboard_screen/widgets/onboard_widget.dart';
import 'package:timbo/widgets/error_widget.dart';

import '../../widgets/custom_circular_progress_indicator.dart';
import '../../widgets/text_widget.dart';
import '../send_code/send_code_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenScreenState();
}

class _OnBoardScreenScreenState extends State<OnBoardScreen> {
  @override
  void initState() {
    context.read<OnBoardProvider>().getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<OnBoardProvider>(
        builder: (context, value, child) {
          return Scaffold(
              body: SizedBox(
            width: 100.sw,
            height: 100.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (value.isLoading) ...{
                  const Center(child: CustomCircularProgressIndidator())
                } else if (value.errorMessage.isNotEmpty) ...{
                  CustomErrorWidget(
                    errorText: value.errorMessage,
                  )
                } else ...{
                  Expanded(
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: value.pageController,
                          itemCount: value.bannerData.length,
                          onPageChanged: (int page) {
                            context
                                .read<OnBoardProvider>()
                                .setCurrentPageIndicator(page);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return OnboardingPage(
                              title: value.bannerData[index].title ?? "",
                              description:
                                  value.bannerData[index].subtitle ?? "",
                              image: value.bannerData[index].image ?? "",
                            );
                          },
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: _buildPageIndicator(context),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.5.w, vertical: 8.h),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SendCodeScreen()));
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color(0xff313131)),
                                    minimumSize: MaterialStatePropertyAll(
                                        Size(100.sw, 50.h))),
                                child: Textwidget(
                                    text: AppStrings.getStarted,
                                    fontSize: 18.sp,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                },
              ],
            ),
          ));
        },
      ),
    );
  }

  List<Widget> _buildPageIndicator(BuildContext context) {
    List<Widget> indicators = [];
    for (int i = 0;
        i < context.read<OnBoardProvider>().bannerData.length;
        i++) {
      indicators.add(
        i == context.read<OnBoardProvider>().currentPage
            ? _indicator(true)
            : _indicator(false),
      );
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 16.0.h,
      width: isActive ? 16.w : 16.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
