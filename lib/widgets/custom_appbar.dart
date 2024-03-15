import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/promotion/promotion_cubit.dart';
import 'package:timbo/widgets/custom_button.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../constants/app_sizes.dart';

class CustomAppbarWidget extends StatefulWidget {
  const CustomAppbarWidget({super.key, this.innerBoxIsScrolled});
  final bool? innerBoxIsScrolled;
  @override
  State<CustomAppbarWidget> createState() => _CustomAppbarWidgetState();
}

class _CustomAppbarWidgetState extends State<CustomAppbarWidget> {
  final CarouselController _carousalController = CarouselController();

  @override
  Widget build(BuildContext context) {
    if (!(widget.innerBoxIsScrolled ?? false)) {
      return BlocBuilder<PromotionCubit, PromotionState>(
        builder: (context, state) {
          if (state is PromotionLoading) {
            return SizedBox(
              height: 330.0.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                        bottom: AppSizes.horizontalScreen8pxPaddingPhone,
                        right: AppSizes.horizontalScreen8pxPaddingPhone,
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            );
          }
          if (state.bannerImages?.isEmpty ?? false) {
            return Container();
          }
          return SizedBox(
            height: 330.0.h,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                  carouselController: _carousalController,
                  options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      height: 330.h,
                      viewportFraction: 1),
                  itemCount: state.bannerImages?.length ?? 0,
                  itemBuilder: (context, index, realIndex) {
                    var item = state.bannerImages?[index];
                    return Container(
                      height: 330.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(item?.imageUrl ?? ""),
                              opacity: 0.6)),
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 330.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.w, right: 30.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Textwidget(
                                          text: item?.name ?? "",
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Textwidget(
                                          text: item?.description ?? "",
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        SizedBox(
                                          width: 100.w,
                                          height: 45.h,
                                          child: CustomButton(
                                            buttonText: AppStrings.showNow,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          _carousalController.previousPage();
                                        },
                                        child: Icon(Icons.chevron_left_rounded,
                                            size: 30.h, color: Colors.white),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _carousalController.nextPage();
                                        },
                                        child: Icon(Icons.chevron_right_rounded,
                                            size: 30.h, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
      return const SizedBox();
    }
  }
}
