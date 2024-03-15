// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/cart/cart_cubit.dart';
import 'package:timbo/logic/home/home_cubit.dart';
import 'package:timbo/logic/promotion/promotion_cubit.dart';
import 'package:timbo/logic/top_category/top_category_cubit.dart';
import 'package:timbo/logic/top_selling/top_selling_cubit.dart';
import 'package:timbo/presentations/home_screen/search_screen/search_screen.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/text_widget.dart';
import 'package:timbo/widgets/top_category_item_widget.dart';
import 'package:timbo/widgets/top_selling_item_widget.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/skeleton_loader_widget.dart';
import '../../../../widgets/textformfield_widget.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      _focus.unfocus();
      // _searchDelegate = SearchScreen();
      // _searchDelegate.();
      showSearch(
        context: context,
        delegate: SearchScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return content();
  }

  Widget content() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          BlocBuilder<PromotionCubit, PromotionState>(
            builder: (context, state) {
              return SliverAppBar(
                surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                backgroundColor: innerBoxIsScrolled
                    ? Theme.of(context).scaffoldBackgroundColor
                    : Theme.of(context).scaffoldBackgroundColor,
                automaticallyImplyLeading: false,
                expandedHeight: 330.h,
                // ((state.bannerImages?.length ?? 0) > 0) ? 330.h : 0.h,
                floating: true,
                toolbarHeight: 55.h,
                flexibleSpace:
                    CustomAppbarWidget(innerBoxIsScrolled: innerBoxIsScrolled),
                actions: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              AppSizes.horizontalScreen20pxPaddingPhone),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: SvgPicture.asset(
                                    "assets/icons/menu-left.svg",
                                    width: 15.w,
                                    height: 15.h,
                                    color:
                                        Theme.of(context).secondaryHeaderColor),
                                onTap: () {
                                  context
                                      .read<HomeCubit>()
                                      .drawerKey
                                      .currentState
                                      ?.openDrawer();
                                },
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                  child: TextformFieldWidget(
                                isBorderColor:
                                    innerBoxIsScrolled ? true : false,
                                focusNode: _focus,
                                hintText: AppStrings.searchProduct,
                                hintTextColor: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                rouneded: 16.r,
                                height: 40.h,
                                fontSize: 12.sp,
                                backgroundColor: innerBoxIsScrolled
                                    ? Colors.white.withOpacity(0.2)
                                    : Colors.white.withOpacity(0.2),
                              )),
                              SizedBox(
                                width: 10.w,
                              ),
                              InkWell(
                                onTap: () {
                                  context.push(Routes.cartScreen);
                                },
                                child: BlocBuilder<CartCubit, CartState>(
                                  builder: (context, state) {
                                    return Badge.count(
                                        count: state
                                                .data?.data?.products?.length ??
                                            0,
                                        largeSize: 16.sp,
                                        smallSize: 16.sp,
                                        textColor: Colors.white,
                                        textStyle: GoogleFonts.kumbhSans(
                                            color: Colors.white,
                                            fontSize: 12.sp),
                                        alignment: Alignment.topRight,
                                        backgroundColor: Colors.blue,
                                        offset: const Offset(8, -5),
                                        isLabelVisible:
                                            state is CartLoading ? false : true,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          child: SizedBox(
                                              height: 35.h,
                                              width: 35.w,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
                                                child: Icon(
                                                    FontAwesomeIcons
                                                        .bagShopping,
                                                    size: 16.h,
                                                    color: Colors.black),
                                              )),
                                        ));
                                  },
                                ),
                              )
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
              );
            },
          )
        ];
      },
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                _topSellingWidget(),
                SizedBox(
                  height: AppSizes.content12pxHeight,
                ),
                _topCategory(),
                // SizedBox(
                //   height: AppSizes.content12pxHeight,
                // ),
                // _bestSeller()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _topSellingWidget() {
    return BlocBuilder<TopSellingCubit, TopSellingState>(
      builder: (context, state) {
        if (state is TopSellingLoading) {
          return CustomSkeletonLoader(
            context: context,
            isTitleVisible: true,
            titleHeight: 30,
            titleWidth: 90,
          );
        }
        if (state.items.isEmpty) {
          return Container();
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                    text: AppStrings.topSelling,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
                InkWell(
                  onTap: () {
                    context.push(Routes.topSellingListScreen,
                        extra: state.items);
                  },
                  child: Textwidget(
                    text: AppStrings.viewAll,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              height: 220.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  var item = state.items[index];
                  return InkWell(
                    onTap: () {
                      context.push("${Routes.productDetailsScreen}/${item.slug}", extra: item);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: TopSellingItemWidget(
                        item: item,
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        );
      },
    );
  }

  _topCategory() {
    return BlocBuilder<TopCategoryCubit, TopCategoryState>(
      builder: (context, state) {
        if (state is TopCategoryLoading) {
          return CustomSkeletonLoader(
            context: context,
            isTitleVisible: true,
            titleHeight: 30,
            titleWidth: 90,
            isGridView: true,
          );
        }
        if (state is TopCategoryError) {
          return Center(
            child: Textwidget(text: state.error),
          );
        }
        if (state.items?.isEmpty ?? false) {
          return const SizedBox();
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                    text: AppStrings.topCategories,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
                InkWell(
                  onTap: () {
                    context.push(Routes.categoryListScreen, extra: state.items);
                  },
                  child: Textwidget(
                    text: AppStrings.viewAll,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSizes.content12pxHeight,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              padding: EdgeInsets.zero,
              itemCount:
                  (state.items?.length ?? 0) > 6 ? 6 : state.items?.length,
              itemBuilder: (context, index) {
                var item = state.items?[index];
                return TopCategoryItemWidget(
                  item: item,
                );
              },
            ),
          ],
        );
      },
    );
  }

  // _bestSeller() {
  //   return Column(
  //     children: [
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Textwidget(
  //               text: AppStrings.bestSellers,
  //               fontSize: 18.sp,
  //               fontWeight: FontWeight.bold),
  //           // Textwidget(
  //           //   text: AppStrings.viewAll,
  //           //   fontSize: 14.sp,
  //           //   fontWeight: FontWeight.bold,
  //           // )
  //         ],
  //       ),
  //       //Askshda told me add like this. Because of we not added payment methods.
  //       Center(
  //         child: Padding(
  //           padding: EdgeInsets.only(top: 20.h),
  //           child: const Textwidget(text: AppStrings.noDataFound),
  //         ),
  //       )
  //       // ListView.builder(
  //       //   physics: const NeverScrollableScrollPhysics(),
  //       //   shrinkWrap: true,
  //       //   itemCount: 4,
  //       //   itemBuilder: (context, index) {
  //       //     return Padding(
  //       //       padding: EdgeInsets.only(top: 6.h),
  //       //       child: Row(
  //       //         crossAxisAlignment: CrossAxisAlignment.start,
  //       //         children: [
  //       //           Padding(
  //       //             padding: EdgeInsets.all(7.0.h),
  //       //             child: Container(
  //       //               height: 97.h,
  //       //               width: MediaQuery.of(context).size.width / 4,
  //       //               decoration: BoxDecoration(
  //       //                   image: DecorationImage(
  //       //                       fit: BoxFit.cover,
  //       //                       image: NetworkImage(topSellings[index]))),
  //       //             ),
  //       //           ),
  //       //           Expanded(
  //       //             child: Padding(
  //       //               padding:
  //       //                   EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
  //       //               child: Column(
  //       //                 mainAxisSize: MainAxisSize.max,
  //       //                 crossAxisAlignment: CrossAxisAlignment.start,
  //       //                 children: [
  //       //                   const Textwidget(
  //       //                     text: "SINGLE TABLE COUCH CHAIR",
  //       //                   ),
  //       //                   SizedBox(
  //       //                     height: 12.h,
  //       //                   ),
  //       //                   RatingBar.builder(
  //       //                     itemSize: 15.w,
  //       //                     initialRating: 3,
  //       //                     minRating: 1,
  //       //                     direction: Axis.horizontal,
  //       //                     allowHalfRating: true,
  //       //                     itemPadding: EdgeInsets.zero,
  //       //                     itemCount: 5,
  //       //                     itemBuilder: (context, _) => const Icon(
  //       //                       Icons.star,
  //       //                       color: Colors.black,
  //       //                     ),
  //       //                     onRatingUpdate: (rating) {
  //       //                       print(rating);
  //       //                     },
  //       //                   ),
  //       //                   SizedBox(
  //       //                     height: 12.h,
  //       //                   ),
  //       //                   Textwidget(
  //       //                     textDecoration: TextDecoration.lineThrough,
  //       //                     text: "",
  //       //                     fontSize: 12.sp,
  //       //                     fontWeight: FontWeight.w500,
  //       //                   ),
  //       //                   SizedBox(
  //       //                     height: 14.h,
  //       //                   ),
  //       //                   Row(
  //       //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //                     children: [
  //       //                       Textwidget(
  //       //                         text: "".toString(),
  //       //                         fontSize: 14.sp,
  //       //                         color: Colors.black,
  //       //                         fontWeight: FontWeight.bold,
  //       //                       ),
  //       //                       _itemOption()
  //       //                     ],
  //       //                   )
  //       //                 ],
  //       //               ),
  //       //             ),
  //       //           )
  //       //         ],
  //       //       ),
  //       //     );
  //       //   },
  //       // ),
  //     ],
  //   );
  // }

  // Widget _itemOption() {
  //   return Row(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 12.w),
  //         child: SvgPicture.asset("assets/icons/whatapp.svg", width: 15.w),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 12.w),
  //         child: SvgPicture.asset("assets/icons/heart.svg", width: 15.w),
  //       ),
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 12.w),
  //         child: SvgPicture.asset("assets/icons/plus.svg", width: 15.w),
  //       )
  //     ],
  //   );
  // }
}
