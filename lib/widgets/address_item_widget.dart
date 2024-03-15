import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/logic/address/address_cubit.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../model/address_response_model/address_response_model.dart';

// ignore: must_be_immutable
class AddressItemWidget extends StatefulWidget {
  AddressItemWidget({
    super.key,
    this.addressItem,
    this.editClick,
    // this.isSelected,
    this.groupValue,
    this.onSelectedChanged,
  });
  final AddressModel? addressItem;
  final VoidCallback? editClick;
  // final bool? isSelected;
  String? groupValue;
  final Function(String?)? onSelectedChanged;

  @override
  State<AddressItemWidget> createState() => _AddressItemWidgetState();
}

class _AddressItemWidgetState extends State<AddressItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
      child: Card(
        color: AppColors.lightTheme.cardColor,
        surfaceTintColor: AppColors.lightTheme.cardColor,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Container(
            decoration: BoxDecoration(
              color: widget.addressItem?.isdefault ?? false
                  ? Colors.blue.withOpacity(0.3)
                  : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            height: AppSizes.height(130),
            width: AppSizes.setWidth(100),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.verticalScreen20pxPaddingPhone,
                horizontal: AppSizes.horizontalScreen12pxPaddingPhone,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Textwidget(
                    text: widget.addressItem?.tag,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textwidget(
                        text:
                            "${widget.addressItem?.street} ${widget.addressItem?.locality} ${widget.addressItem?.city},",
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppSizes.small12pxTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      Textwidget(
                        text:
                            "${widget.addressItem?.state}, ${widget.addressItem?.zip}",
                        textOverflow: TextOverflow.ellipsis,
                        fontSize: AppSizes.small12pxTextSize,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Radio<String?>(
                          activeColor: Colors.black,
                          value: widget.addressItem?.id,
                          groupValue: widget.groupValue,
                          onChanged: widget.onSelectedChanged,
                        ),
                        const Textwidget(
                          text: "Default",
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: widget.editClick,
                          child: Icon(
                            Icons.edit,
                            size: 18.h,
                          ),
                        ),
                        // TextButton(
                        //     style: ButtonStyle(
                        //       minimumSize: MaterialStateProperty.all<Size>(
                        //           Size(50.w, 0.h)),
                        //       shape: MaterialStateProperty.all<
                        //               RoundedRectangleBorder>(
                        //           RoundedRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.circular(8.0.r),
                        //               side: const BorderSide(
                        //                   color: Colors.grey))),
                        //     ),
                        //     onPressed: widget.editClick,
                        //     child: const Textwidget(
                        //       text: "Edit",
                        //     )),
                        SizedBox(
                          width: 10.w,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<AddressCubit>().removeAddressById(
                                widget.addressItem?.id ?? '');
                          },
                          child: Icon(
                            Icons.delete,
                            size: 18.h,
                          ),
                        ),
                        // TextButton(
                        //     style: ButtonStyle(
                        //         maximumSize: MaterialStateProperty.all<Size>(
                        //             Size(90.w, 30.h)),
                        //         minimumSize: MaterialStateProperty.all<Size>(
                        //             Size(50.w, 0.h)),
                        //         shape: MaterialStateProperty.all<
                        //                 RoundedRectangleBorder>(
                        //             RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(8.0.r),
                        //         )),
                        //         backgroundColor: const MaterialStatePropertyAll(
                        //             Color.fromARGB(255, 26, 25, 25))),
                        //     onPressed: () {
                        //       context.read<AddressCubit>().removeAddressById(
                        //           widget.addressItem?.id ?? '');
                        //     },
                        //     child: Textwidget(
                        //       text: "Remove",
                        //       fontSize: AppSizes.small12pxTextSize,
                        //       color: Colors.white,
                        //     ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
