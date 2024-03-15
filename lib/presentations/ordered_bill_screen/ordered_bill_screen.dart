import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:timbo/logic/order/ordered_bill/ordered_bill_cubit.dart';
import 'package:timbo/utils/extension/extension.dart';
import 'package:timbo/widgets/custom_circular_progress_indicator.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../widgets/text_widget.dart';

class OrderBillScreen extends StatefulWidget {
  const OrderBillScreen({
    super.key,
    this.orderId,
  });

  final int? orderId;
  @override
  State<OrderBillScreen> createState() => _OrderBillScreenState();
}

class _OrderBillScreenState extends State<OrderBillScreen> {
  @override
  void initState() {
    context.read<OrderedBillCubit>().getOredredBillData(widget.orderId ?? 0);
    super.initState();
  }

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
            text: AppStrings.orderBill,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocBuilder<OrderedBillCubit, OrderedBillState>(
          builder: (context, state) {
            if (state is OrderedBillLoading) {
              return const Center(
                child: CustomCircularProgressIndidator(),
              );
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
                  vertical: AppSizes.verticalScreen12pxPaddingPhone),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Textwidget(
                        text: "Your order is on the way",
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Center(
                      child: Lottie.asset("assets/json/truck_outline.json",
                          fit: BoxFit.fitHeight, height: 200),
                    ),
                    _addressPrizeDetails(),
                    _orderedItemsWidget(),
                    _priceDetails(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _addressPrizeDetails() {
    return BlocBuilder<OrderedBillCubit, OrderedBillState>(
      builder: (context, state) {
        DateTime parsedDateTime =
            DateTime.parse(state.ordredModel?.date?.toIso8601String() ?? '');
        String formattedDate = DateFormat('dd-MM-yyyy').format(parsedDateTime);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textwidget(
                  text: "Summary:",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textwidget(
                      text: "Order No:",
                      fontSize: 13.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Textwidget(
                      text: state.ordredModel?.orderId.toString(),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textwidget(
                      text: "Order Date:",
                      fontSize: 13.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Textwidget(
                      text: formattedDate,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Textwidget(
                      text: "Order Prize:",
                      fontSize: 13.sp,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Textwidget(
                      text: state.ordredModel?.totalAmount?.inRupeesFormat(),
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textwidget(
                  text: "Shipping Address:",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
                Textwidget(
                  text:
                      "${state.ordredModel?.deliveryInfo?.shippingAddress?.street}, ${state.ordredModel?.deliveryInfo?.shippingAddress?.locality}",
                  fontSize: 13.sp,
                ),
                Textwidget(
                  text:
                      "${state.ordredModel?.deliveryInfo?.shippingAddress?.city}, ${state.ordredModel?.deliveryInfo?.shippingAddress?.state}",
                  fontSize: 13.sp,
                ),
                Textwidget(
                  text: state.ordredModel?.deliveryInfo?.shippingAddress?.zip,
                  fontSize: 13.sp,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _orderedItemsWidget() {
    return Container(
      padding: EdgeInsets.only(top: AppSizes.verticalScreen12pxPaddingPhone),
      child: Column(children: [
        Container(
          color: Colors.grey.withOpacity(0.4),
          padding: EdgeInsets.all(10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Textwidget(
                text: 'Items Shipped',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              Textwidget(
                text: ' ',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              Textwidget(
                text: 'Quantity',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
              Textwidget(
                text: 'Price',
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        _productList(),
        Divider(height: 3.h),
      ]),
    );
  }

  _priceDetails() {
    return BlocBuilder<OrderedBillCubit, OrderedBillState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textwidget(
                        text: 'Sub Total :',
                        fontSize: 14.sp,
                      ),
                      Textwidget(
                        text: 'Shipping Charges :',
                        fontSize: 14.sp,
                      ),
                      Textwidget(
                        text: 'Total Order :',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Textwidget(
                        text: state.ordredModel?.totalAmount?.inRupeesFormat(),
                        fontSize: 14.sp,
                      ),
                      Textwidget(
                        text: "FREE Delivery",
                        fontSize: 14.sp,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                      Textwidget(
                        text: state.ordredModel?.totalAmount?.inRupeesFormat(),
                        fontSize: 14.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  _productList() {
    return BlocBuilder<OrderedBillCubit, OrderedBillState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.ordredModel?.products?.length,
              itemBuilder: (context, index) {
                var data = state.ordredModel?.products?[index];
                return cartItemWidget(
                  data?.productId?.pictures?[0],
                  data?.productId?.name,
                  data?.quantity,
                  data?.productId?.sellingPrice,
                );
              }),
        );
      },
    );
  }

  Widget cartItemWidget(
      String? imageUrl, String? productName, int? quantity, int? price) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 70.w,
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? "",
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                width: 130.w,
                child: Textwidget(
                  text: productName,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Textwidget(
            text: quantity.toString(),
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          Textwidget(
            text: price?.inRupeesFormat(),
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
