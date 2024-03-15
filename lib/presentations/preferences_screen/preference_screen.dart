import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/logic/favorite_category/cubit/favorite_category_cubit.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/custom_button.dart';
import 'package:timbo/widgets/custom_circular_progress_indicator.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../constants/app_strings.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<FavoriteCategoryCubit, FavoriteCategoryState>(
          builder: (context, state) {
            if (state is FavoriteCategoryLoading) {
              return const Center(child: CustomCircularProgressIndidator());
            }
            if (state is FavoriteCategoryError) {
              return Textwidget(
                text: state.errorMesage,
              );
            }
            return SizedBox(
              height: AppSizes.setHeight(100),
              width: AppSizes.setWidth(100),
              child: Padding(
                padding: EdgeInsets.only(
                    top: AppSizes.horizontalScreen25pxPaddingPhone),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Textwidget(
                        text: AppStrings.selectFavoritesCategory,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.const20pxTextSize),
                    SizedBox(
                      height: AppSizes.verticalScreen8pxPaddingPhone,
                    ),
                    Textwidget(
                        text: AppStrings.selectFavoritesCategoryDescription,
                        fontWeight: FontWeight.w500,
                        fontSize: AppSizes.medium14pxTextSize),
                    SizedBox(
                      height: AppSizes.verticalScreen8pxPaddingPhone,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              AppSizes.horizontalScreen25pxPaddingPhone),
                      child: const Divider(
                        color: AppColors.backgroundGreyDark,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                AppSizes.horizontalScreen25pxPaddingPhone),
                        child: GridView.builder(
                          itemCount: state.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            var item = state.items[index];
                            return InkWell(
                              onTap: () {
                                context
                                    .read<FavoriteCategoryCubit>()
                                    .setSelected(
                                        item.isSelected ?? false, index);
                              },
                              child: Card(
                                elevation: (item.isSelected ?? false) ? 2 : 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.h),
                                    border: Border.all(
                                        color: (item.isSelected ?? false)
                                            ? AppColors.backgroundGreyDark
                                            : AppColors.backgroundGrey,
                                        width: 1.w),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      (item.isSelected ?? false)
                                          ? const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Icon(
                                                      FontAwesomeIcons
                                                          .circleCheck,
                                                      size: 16),
                                                ),
                                              ],
                                            )
                                          : const SizedBox(),
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment:
                                              (item.isSelected ?? false)
                                                  ? CrossAxisAlignment.start
                                                  : CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Textwidget(
                                              text: item.name ?? "",
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.verticalScreen12pxPaddingPhone,
                          horizontal:
                              AppSizes.horizontalScreen25pxPaddingPhone),
                      child: CustomButton(
                        buttonText: AppStrings.start,
                        onPress: () {
                          context.push(Routes.homeScreen);
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
