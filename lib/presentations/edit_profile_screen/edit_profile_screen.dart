// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/image_upload/image_upload_cubit.dart';
import 'package:timbo/logic/profile/profile_cubit.dart';
import 'package:timbo/widgets/custom_circular_progress_indicator.dart';
import 'package:timbo/widgets/text_widget.dart';
import 'package:timbo/widgets/textformfield_widget.dart';

import '../../constants/app_colors.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';

import 'package:timbo/utils/extension/extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var imageUrl = '';
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          context.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          systemOverlayStyle: systemOverLayStyle,
          centerTitle: true,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Textwidget(
            text: AppStrings.editProfile,
            fontSize: AppSizes.heavy18pxTextSize,
          ),
          actions: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child:
                        const Center(child: CustomCircularProgressIndidator()),
                  );
                }

                return IconButton(
                    onPressed: () {
                      context.read<ProfileCubit>().updateUserProfile(
                          state.userData?.data?.name ?? "", imageUrl);
                    },
                    icon: Icon(
                      FontAwesomeIcons.save,
                      size: 18.h,
                      color: Theme.of(context).secondaryHeaderColor,
                    ));
              },
            ),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CustomCircularProgressIndidator());
            }
            if (state is ProfileLoaded) {
              imageUrl = state.userData?.data?.imageUrl ?? "";
              return SizedBox(
                width: 100.sw,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
                      vertical: AppSizes.verticalScreen8pxPaddingPhone),
                  child: Column(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            BlocBuilder<ImageUploadCubit, ImageUploadState>(
                              builder: (context, imageState) {
                                if (imageState is ImageUploadLoading) {
                                  return const Center(
                                      child: CustomCircularProgressIndidator());
                                }
                                if (imageState is ImageUploadSuccess) {
                                  imageUrl = imageState.url.toString();
                                  context
                                      .read<ProfileCubit>()
                                      .updateUserProfile(
                                          state.userData?.data?.name ?? "",
                                          imageState.url.toString());
                                  return Container(
                                    width: 130.w,
                                    height: 130.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.lightTheme
                                              .scaffoldBackgroundColor,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              offset: const Offset(0, 5))
                                        ],
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                              imageUrl,
                                            ))),
                                  );
                                }
                                return Container(
                                  width: 130.w,
                                  height: 130.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: AppColors
                                          .lightTheme.scaffoldBackgroundColor,
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
                                      text: state.userData?.data?.name
                                          ?.getInitials(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Container(
                              width: 130.w,
                              height: 130.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors
                                        .lightTheme.scaffoldBackgroundColor,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        color: Colors.black.withOpacity(0.9),
                                        offset: const Offset(0, 5))
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        imageUrl,
                                      ))),
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
                                      _uploadImageBottomSheet(context);
                                    },
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextformFieldWidget(
                        isEditable: true,
                        initialValue: state.userData?.data?.name ?? "",
                        hintText: AppStrings.name,
                        fontSize: 14.sp,
                        onChanged: (value) {
                          state.userData?.data?.name = value;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextformFieldWidget(
                        isEditable: false,
                        initialValue: state.userData?.data?.phoneNumber ?? "",
                        hintText: "Mobile No",
                        fontSize: 14.sp,
                        textInputType: TextInputType.number,
                        onChanged: (value) {
                          state.userData?.data?.mobile = value;
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          }),
        ),
      ),
    );
  }

  void _uploadImageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        // isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.read<ImageUploadCubit>().pickImage(context);
                      },
                      child: Textwidget(
                        text: AppStrings.uploadGallary,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<ImageUploadCubit>()
                            .captureAndUploadImage(context);
                      },
                      child: Textwidget(
                        text: AppStrings.takePhoto,
                        fontSize: 15.sp,
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
