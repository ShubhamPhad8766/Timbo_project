import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/utils/app_utils/snackbar/snackbar.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/custom_button.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../logic/company_setup/company_setup_cubit.dart';
import '../../widgets/textformfield_widget.dart';

class CompanySetupScreen extends StatefulWidget {
  const CompanySetupScreen({super.key});

  @override
  State<CompanySetupScreen> createState() => _CompanySetupScreenState();
}

class _CompanySetupScreenState extends State<CompanySetupScreen> {
  final TextEditingController companyName = TextEditingController(text: "");
  final TextEditingController taxId = TextEditingController(text: "");
  final TextEditingController cinNumber = TextEditingController(text: "");

  final TextEditingController streetAddressController =
      TextEditingController(text: "");
  final TextEditingController locality = TextEditingController(text: "");
  final TextEditingController city = TextEditingController(text: "");
  final TextEditingController statetxt = TextEditingController(text: "");
  final TextEditingController zipCode = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CompanySetupCubit, CompanySetupState>(
        listener: (context, state) {
          if (state is CompanySetupError) {
            SnackBarWidget.showSnackbar(context, state.error);
          } else if (state is CompanySetupSuccess) {
            context.push(Routes.preferenceScreen);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<CompanySetupCubit, CompanySetupState>(
            builder: (context, state) {
              return Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                height: AppSizes.setHeight(100),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 25.w,
                    right: 25.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: AppSizes.horizontalScreen25pxPaddingPhone),
                        child: Textwidget(
                            text: AppStrings.companyDetails,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.const20pxTextSize),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Textwidget(
                          text: AppStrings.doYouHaveCompany,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.medium14pxTextSize),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                        hintText: AppStrings.companyName,
                        controller: companyName,
                        fontSize: AppSizes.medium14pxTextSize,
                      ),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                        hintText: AppStrings.taxId,
                        controller: taxId,
                        fontSize: AppSizes.medium14pxTextSize,
                      ),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                        hintText: AppStrings.cinNumber,
                        controller: cinNumber,
                        fontSize: AppSizes.medium14pxTextSize,
                      ),
                      SizedBox(height: AppSizes.content12pxHeight),
                      Textwidget(
                          text: AppStrings.addressForDelivery,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.medium14pxTextSize),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                        hintText: AppStrings.streetAddress,
                        controller: streetAddressController,
                      ),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                          hintText: AppStrings.locality,
                          controller: locality,
                          fontSize: AppSizes.medium14pxTextSize),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                          hintText: AppStrings.city,
                          controller: city,
                          fontSize: AppSizes.medium14pxTextSize),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                          hintText: AppStrings.state,
                          controller: statetxt,
                          fontSize: AppSizes.medium14pxTextSize),
                      SizedBox(height: AppSizes.content12pxHeight),
                      TextformFieldWidget(
                        hintText: AppStrings.zip,
                        controller: zipCode,
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          context.push(Routes.preferenceScreen);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                    side: const BorderSide(
                                        color: AppColors.backgroundGreyMed))),
                            minimumSize:
                                MaterialStatePropertyAll(Size(100.sw, 45.h))),
                        child: Textwidget(
                            text: AppStrings.skip,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSizes.verticalScreen12pxPaddingPhone),
                        child: CustomButton(
                          buttonText: AppStrings.start,
                          inProgress:
                              state is CompanySetupLoading ? true : false,
                          onPress: () {
                            context.read<CompanySetupCubit>().saveCompanySetup(
                                  name: companyName.text.trim(),
                                  taxId: taxId.text.trim(),
                                  cinNumber: cinNumber.text.trim(),
                                  locality: locality.text.trim(),
                                  streetAddress:
                                      streetAddressController.text.trim(),
                                  city: city.text.trim(),
                                  state: statetxt.text.trim(),
                                  zipCode: zipCode.text.trim(),
                                );
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
      ),
    );
  }
}
