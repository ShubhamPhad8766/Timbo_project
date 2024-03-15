import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/verify_otp/verify_otp_cubit.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../../constants/app_colors.dart';
import '../../utils/app_utils/snackbar/snackbar.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/custom_button.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key, this.phoneNumber});
  final String? phoneNumber;
  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController otp = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<VerifyOtpCubit, VerifyOtpState>(
        listener: (context, state) {
          if (state is VerifyOtpUserNotExists) {
            context.push(Routes.basicInfoScreen,
                extra: {"phoneNumber": state.phoneNumber});
          } else if (state is VerifyOtpError) {
            SnackBarWidget.showSnackbar(context, state.errorMesage ?? "");
          } else if (state is UserLoggedIn) {
            context.push(Routes.homeScreen);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
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
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppSizes.height(115),
                        ),
                        child: Textwidget(
                            text: AppStrings.verifySecurityCode,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.const20pxTextSize),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Textwidget(
                          text: AppStrings.verifyDescriptionMessage,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.medium14pxTextSize),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 19.h,
                        ),
                        child: Pinput(
                          obscureText: true,
                          obscuringCharacter: AppStrings.obsureOtpText,
                          obscuringWidget: Textwidget(
                            text: AppStrings.obsureOtpText,
                            fontSize: AppSizes.heavy18pxTextSize,
                            color: Colors.black,
                          ),
                          closeKeyboardWhenCompleted: true,
                          keyboardType: TextInputType.number,
                          controller: otp,
                          focusedPinTheme: PinTheme(
                              height: AppSizes.height(45),
                              width: AppSizes.width(45),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.lightTheme.dividerColor
                                        .withOpacity(0.5),
                                  ),
                                  color: AppColors.lightTheme.cardColor,
                                  borderRadius: BorderRadius.circular(5.r))),
                          defaultPinTheme: PinTheme(
                              height: AppSizes.height(45),
                              width: AppSizes.width(45),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.lightTheme.dividerColor
                                        .withOpacity(0.5),
                                  ),
                                  color: AppColors.lightTheme.cardColor,
                                  borderRadius: BorderRadius.circular(5.r))),
                          length: 6,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  AppSizes.verticalScreen20pxPaddingPhone),
                          child: CustomButton(
                            inProgress: state is VerifyOtpLoading,
                            buttonText: AppStrings.verifyCode,
                            onPress: () {
                              context.read<VerifyOtpCubit>().verifyOtp(
                                  phoneNumber: widget.phoneNumber ?? "",
                                  otp: int.parse(otp.text.trim()));
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
