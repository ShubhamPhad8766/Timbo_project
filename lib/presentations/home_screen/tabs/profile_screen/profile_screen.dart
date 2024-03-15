import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/profile/profile_cubit.dart';
import 'package:timbo/utils/extension/extension.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/custom_circular_progress_indicator.dart';
import 'package:timbo/widgets/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imageUrl = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogoutState) {
          context.pushReplacement(Routes.optionScreen);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Textwidget(
            fontSize: 18.sp,
            text: AppStrings.profile,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            imageUrl = state.userData?.data?.imageUrl;
            if (state is ProfileLoading) {
              return const Center(
                child: CustomCircularProgressIndidator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color:
                                  AppColors.lightTheme.scaffoldBackgroundColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.9),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                imageUrl ?? "",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 130.w,
                          height: 130.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color:
                                  AppColors.lightTheme.scaffoldBackgroundColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.9),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Textwidget(
                              color: Colors.white,
                              fontSize: 35.sp,
                              fontWeight: FontWeight.w600,
                              text: state.userData?.data?.name?.getInitials(),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                              height: 35.h,
                              width: 35.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors
                                      .lightTheme.scaffoldBackgroundColor,
                                ),
                                color: Colors.black,
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 16.h,
                                ),
                                onPressed: () {
                                  context.push(Routes.editProfileScreen);
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Textwidget(
                    text: state.userData?.data?.name.toString().capitalize() ??
                        "",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 10),
                  Textwidget(
                    text:
                        state.userData?.data?.mobile.toString().capitalize() ??
                            "",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.content8pxHeight),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppSizes.horizontalScreen8pxPaddingPhone),
                          child: Divider(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        SizedBox(height: AppSizes.content8pxHeight),
                        profileMenu(
                          () {
                            // context.push(Routes.myOrdersScreen);
                          },
                          FontAwesomeIcons.bagShopping,
                          AppStrings.myOrders,
                          FontAwesomeIcons.chevronRight,
                        ),
                        profileMenu(() {
                          context.push(Routes.addressScreen);
                        }, FontAwesomeIcons.locationDot, AppStrings.address,
                            FontAwesomeIcons.chevronRight),
                        profileMenu(
                            () {},
                            FontAwesomeIcons.bell,
                            AppStrings.notifications,
                            FontAwesomeIcons.chevronRight),
                        profileMenu(() {}, FontAwesomeIcons.moneyCheck,
                            AppStrings.payment, FontAwesomeIcons.chevronRight),
                        profileMenu(() {}, FontAwesomeIcons.userLock,
                            AppStrings.security, FontAwesomeIcons.chevronRight),
                        profileMenu(() {}, FontAwesomeIcons.listCheck,
                            AppStrings.language, FontAwesomeIcons.chevronRight),
                        profileMenu(
                            () {},
                            FontAwesomeIcons.exclamation,
                            AppStrings.helpCenter,
                            FontAwesomeIcons.chevronRight),
                        profileMenu(() {
                          context.push(Routes.about);
                        }, FontAwesomeIcons.circleInfo, AppStrings.about,
                            FontAwesomeIcons.chevronRight),
                        profileMenu(() {
                          context.read<ProfileCubit>().signOut(context);
                        }, FontAwesomeIcons.rightFromBracket, AppStrings.logout,
                            FontAwesomeIcons.chevronRight),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget profileMenu(
      Function ontap, IconData icon, String text, IconData trailingIcon) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8.r)),
          width: AppSizes.setHeight(100),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(AppSizes.verticalScreen12pxPaddingPhone),
                child: Icon(icon,
                    color: Theme.of(context).secondaryHeaderColor, size: 16.h),
              ),
              SizedBox(
                width: 10.w,
              ),
              Textwidget(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(trailingIcon,
                    color: Theme.of(context).secondaryHeaderColor, size: 15.w),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
