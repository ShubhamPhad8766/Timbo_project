import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/utils/app_utils/popUp/pop_up.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/app_utils/app_utils/app_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/text_widget.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          systemOverlayStyle: systemOverLayStyle,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Textwidget(
            fontSize: 18.sp,
            text: AppStrings.deleteAccount,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: Scrollbar(
          thickness: 4.0,
          thumbVisibility: true,
          radius: Radius.circular(15.r),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.verticalScreen20pxPaddingPhone,
                horizontal: AppSizes.horizontalScreen20pxPaddingPhone),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                  text: "Are you sure you want to delete account?",
                  fontSize: 17.sp,
                ),
                SizedBox(
                  child: CustomButton(
                    buttonText: "Delete",
                    buttonTextSize: 17.sp,
                    onPress: () {
                      PopUpWidget.showPopup(
                          context,
                          "Your account will be Delete in within 3 days",
                          "assets/json/delete_icons.json");
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
