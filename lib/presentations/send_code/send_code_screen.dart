import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/send_otp/send_otp_cubit.dart';
import 'package:timbo/utils/app_utils/keyboard_dismiss/keyboard_utils.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/custom_button.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../constants/app_sizes.dart';
import '../../utils/app_utils/snackbar/snackbar.dart';
import '../../widgets/textformfield_widget.dart';

class SendCodeScreen extends StatefulWidget {
  const SendCodeScreen({super.key});

  @override
  State<SendCodeScreen> createState() => _SendCodeScreenState();
}

class _SendCodeScreenState extends State<SendCodeScreen> {
  final TextEditingController phoneNumber = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendOtpCubit, SendOtpState>(
      listener: (context, state) {
        if (state is SendOtpSuccess) {
          context.push(Routes.verifyCodeScreen,
              extra: {"phoneNumber": phoneNumber.text.trim()});
        } else if (state is SendOtpError) {
          SnackBarWidget.showSnackbar(context, state.errorMessage ?? "");
        }
      },
      child: BlocBuilder<SendOtpCubit, SendOtpState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              KeyBoardUtils.hideKeyBoard(context);
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: Container(
                height: AppSizes.setHeight(115),
                width: AppSizes.setWidth(100),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: AppSizes.height(115),
                          left: AppSizes.horizontalScreen25pxPaddingPhone),
                      child: Textwidget(
                          text: AppStrings.enterYourWhatsNumber,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.const20pxTextSize),
                    ),
                    SizedBox(
                      height: AppSizes.content8pxHeight,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppSizes.horizontalScreen25pxPaddingPhone),
                      child: Textwidget(
                          text: AppStrings.confirmToWhatsNumber,
                          fontWeight: FontWeight.w500,
                          fontSize: AppSizes.medium14pxTextSize),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18.h,
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: SizedBox(
                        height: AppSizes.height(45),
                        child: TextformFieldWidget(
                          inputFormater: [LengthLimitingTextInputFormatter(10)],
                          textInputType: TextInputType.phone,
                          controller: phoneNumber,
                          rouneded: 5.h,
                          height: AppSizes.height(45),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(
                    //     top: 10.h,
                    //     left: 15.w,
                    //     right: 25.w,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Checkbox(
                    //         side: BorderSide(
                    //           color: Theme.of(context).secondaryHeaderColor,
                    //         ),
                    //         shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(3.h)),
                    //         value: false,
                    //         onChanged: (value) {},
                    //       ),
                    //       Textwidget(
                    //         text: AppStrings.sendonWhatsApp,
                    //         fontSize: AppSizes.medium14pxTextSize,
                    //         fontWeight: FontWeight.w500,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.horizontalScreen25pxPaddingPhone,
                          vertical: AppSizes.verticalScreen20pxPaddingPhone),
                      child: CustomButton(
                        buttonText: AppStrings.sendCode,
                        inProgress: state is SendOtpLoading ? true : false,
                        onPress: () {
                          context
                              .read<SendOtpCubit>()
                              .sendOtp(phoneNumber.text.trim());
                          KeyBoardUtils.hideKeyBoard(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
