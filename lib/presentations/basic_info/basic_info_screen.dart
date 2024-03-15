import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';

import 'package:timbo/logic/personal_info/personal_info_cubit.dart';
import 'package:timbo/widgets/custom_button.dart';

import 'package:timbo/widgets/text_widget.dart';
import 'package:timbo/widgets/textformfield_widget.dart';

import '../../utils/app_utils/snackbar/snackbar.dart';
import '../../utils/routes/routes.dart';

class BasicInfoScreen extends StatefulWidget {
  const BasicInfoScreen({super.key, this.phoneNumber});
  final String? phoneNumber;
  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  final TextEditingController name = TextEditingController(text: "");
  final TextEditingController password = TextEditingController(text: "");
  final TextEditingController securityPin = TextEditingController(text: "");

  final TextEditingController streetAddressController =
      TextEditingController(text: "");
  final TextEditingController locality = TextEditingController(text: "");
  final TextEditingController city = TextEditingController(text: "");
  final TextEditingController statetxt = TextEditingController(text: "");
  final TextEditingController zipCode = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<PersonalInfoCubit, PersonalInfoState>(
        listener: (context, state) {
          if (state is PersonalInfoSuccess) {
            context.push(Routes.companyInfoScreen);
          } else if (state is PersonalInfoError) {
            SnackBarWidget.showSnackbar(context, state.error);
          } else if (state is SignUpError) {
            SnackBarWidget.showSnackbar(context, state.error);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<PersonalInfoCubit, PersonalInfoState>(
            builder: (context, state) {
              return Container(
                height: AppSizes.setHeight(100),
                width: AppSizes.setWidth(100),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalScreen25pxPaddingPhone),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSizes.horizontalScreen25pxPaddingPhone),
                        child: Textwidget(
                            text: AppStrings.personalInfo,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.const20pxTextSize),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Textwidget(
                          text: AppStrings.setupBasicInfo,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.medium14pxTextSize),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: name,
                        hintText: AppStrings.enterYourName,
                        fontSize: AppSizes.medium14pxTextSize,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: password,
                        fontSize: AppSizes.medium14pxTextSize,
                        hintText: AppStrings.password,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: securityPin,
                        hintText: AppStrings.setPin,
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      Textwidget(
                          text: AppStrings.addressForDelivery,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        fontSize: 14.sp,
                        controller: streetAddressController,
                        hintText: AppStrings.addressHouseStreet,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: locality,
                        hintText: AppStrings.locality,
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: city,
                        hintText: AppStrings.city,
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: statetxt,
                        hintText: AppStrings.state,
                        fontSize: 14.sp,
                      ),
                      SizedBox(
                        height: AppSizes.content12pxHeight,
                      ),
                      TextformFieldWidget(
                        controller: zipCode,
                        hintText: AppStrings.zip,
                        fontSize: 14.sp,
                      ),
                      const Spacer(),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  AppSizes.verticalScreen20pxPaddingPhone),
                          child: CustomButton(
                            inProgress:
                                state is PersonalInfoLoading ? true : false,
                            buttonText: AppStrings.start,
                            onPress: () {
                              context.read<PersonalInfoCubit>().signUp(
                                    fullname: name.text.trim(),
                                    number: widget.phoneNumber,
                                    password: password.text.trim(),
                                    securityPin: securityPin.text.trim(),
                                    locality: locality.text.trim(),
                                    streetAddress:
                                        streetAddressController.text.trim(),
                                    city: city.text.trim(),
                                    state: statetxt.text.trim(),
                                    zipCode: zipCode.text.trim(),
                                  );
                            },
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
