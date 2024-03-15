import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/logic/payment/payment_cubit.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../model/address_response_model/default_address_response_model.dart';
import '../../model/order_summary_response_model/order_summary_response_model.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../utils/preferences/local_preferences.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    this.addressModel,
    this.orderedProduct,
    this.totalAmount,
  });
  final AddressModel? addressModel;
  final ProductData? orderedProduct;
  final int? totalAmount;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final DateTime dateNow = DateTime.now();
  String _paymentMode = 'Cash On Delivery';
  final List<String> _paymentModes = ["Cash On Delivery"];
  // final List<String> _paymentModes = ["Cash On Delivery" , "UPI","NetBanking"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            text: AppStrings.makePayment,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
              vertical: AppSizes.verticalScreen12pxPaddingPhone),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _paymentWidget(),
            ],
          ),
        ),
        bottomSheet: _customButtom(context),
      ),
    );
  }

  _paymentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Textwidget(
          text: "Payment Method : ",
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
            height: _paymentModes.length * 62.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            padding: EdgeInsets.only(top: 7.h),
            child: ListView.builder(
                itemCount: _paymentModes.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                      title: Textwidget(text: _paymentModes[index]),
                      value: _paymentModes[index],
                      groupValue: _paymentMode,
                      onChanged: (value) {
                        setState(() {
                          _paymentMode = value.toString();
                        });
                      });
                })),
      ],
    );
  }

  _customButtom(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.verticalScreen8pxPaddingPhone,
            horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
          ),
          child: CustomButton(
            buttonTextSize: AppSizes.large16pxTextSize,
            buttonText: AppStrings.confirmOrder,
            inProgress: state is PaymentLoading,
            onPress: () {
              context.read<PaymentCubit>().savePayment(
                    context: context,
                    userId: LocalStorage.tokenResponseModel.id,
                    userName: LocalStorage.tokenResponseModel.name,
                    totalAmount: widget.totalAmount,
                    addressId: widget.addressModel?.id,
                    street: widget.addressModel?.street,
                    locality: widget.addressModel?.locality,
                    city: widget.addressModel?.city,
                    state: widget.addressModel?.state,
                    zip: widget.addressModel?.zip,
                    products: widget.orderedProduct?.products,
                    paymentMode: _paymentMode,
                    currentDate: dateNow.toIso8601String(),
                  );
            },
          ),
        );
      },
    );
  }
}
