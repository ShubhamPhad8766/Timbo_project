import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/logic/order_summary/order_summary_cubit.dart';
import 'package:timbo/utils/extension/extension.dart';
import 'package:timbo/widgets/custom_skeleton_loader.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../logic/address/default_address_cubit/default_address_cubit.dart';
// import '../../model/address_response_model/default_address_response_model.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_widget.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  @override
  void initState() {
    context.read<OrderSummaryCubit>().getOrderSummaryByUserId();
    context.read<DefaultAddressCubit>().getDefaultAddress();
    super.initState();
  }

  // AddressModel? _addressObject;

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
            text: AppStrings.orderSummary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
                vertical: AppSizes.verticalScreen5pxPaddingPhone),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _addressWidget(),
                SizedBox(
                  height: 20.h,
                ),
                _cartWidget(),
                SizedBox(
                  height: 20.h,
                ),
                _priceDetails(),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: _customButtom(),
      ),
    );
  }

  _addressWidget() {
    return BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
      builder: (context, state) {
        // _addressObject = state.defaultAddressResponseModel.data;
        if (state is DefaultAddressLoading) {
          return SizedBox(
            height: 50,
            child: CustomSkeletonCard(
              context: context,
              listCount: 1,
              cardHeight: 50,
            ),
          );
        }
        if (state.defaultAddressResponseModel.data == null) {
          return const Center(
            child: Textwidget(text: "Set Default Address"),
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Textwidget(
                      text: "${AppStrings.deliverTo} : ",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                    Textwidget(
                      text: " ${state.defaultAddressResponseModel.data?.tag} ",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent.shade100,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                    Textwidget(
                      text: " ${AppStrings.address}",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Textwidget(
                      text:
                          "${state.defaultAddressResponseModel.data?.street}, ",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                    Textwidget(
                      text:
                          "${state.defaultAddressResponseModel.data?.locality}, ",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                    Textwidget(
                      text: "${state.defaultAddressResponseModel.data?.city} ",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Textwidget(
                      text:
                          "${state.defaultAddressResponseModel.data?.state}, ",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                    Textwidget(
                      text: "${state.defaultAddressResponseModel.data?.zip}",
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: AppSizes.medium14pxTextSize,
                    ),
                  ],
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _cartWidget() {
    return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
      builder: (context, state) {
        if (state is OrderSummaryLoading) {
          return SizedBox(
            height: 300,
            child: CustomSkeletonCard(
              context: context,
              listCount: 4,
              cardHeight: 60,
            ),
          );
        }
        if (state is OrderSummaryError) {
          return Center(
              child: Textwidget(
            text: state.errorMesage,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ));
        }

        if (state.orderData?.data?.products != null) {
          return ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: state.orderData?.data?.products?.length,
            itemBuilder: ((context, index) {
              var item = state.orderData?.data?.products?[index];
              return Column(
                children: [
                  Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(
                                  AppSizes.horizontalScreen8pxPaddingPhone),
                              child: CachedNetworkImage(
                                  errorWidget: (context, url, error) {
                                    return Image.asset(
                                        "assets/images/noimage.png",
                                        fit: BoxFit.contain);
                                  },
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      item?.productId?.pictures?.first ?? ""),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: AppSizes.content12pxHeight),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Textwidget(
                                        text: item?.productId?.name ?? "",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Row(
                                    children: [
                                      Textwidget(
                                        text: item?.productId?.sellingPrice
                                            ?.toInt()
                                            .inRupeesFormat(),
                                        fontSize: AppSizes.medium14pxTextSize,
                                        fontWeight: FontWeight.w500,
                                        textDecoration:
                                            TextDecoration.lineThrough,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Textwidget(
                                        text: item?.productId?.buyingPrice
                                            ?.toInt()
                                            .inRupeesFormat(),
                                        fontSize: AppSizes.large16pxTextSize,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Textwidget(
                                        text: "${AppStrings.quantity} : ",
                                        fontSize: 13.sp,
                                      ),
                                      Textwidget(
                                        text: item?.quantity.toString(),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              );
            }),
          );
        }
        return Container();
      },
    );
  }

  _priceDetails() {
    return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
      builder: (context, state) {
        if (state is OrderSummaryLoading) {
          return SizedBox(
            height: 200,
            child: CustomSkeletonCard(
              context: context,
              listCount: 3,
              cardHeight: 60,
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textwidget(
              text: "${AppStrings.prizeDeatils} : ",
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                  text: "Prize",
                  fontSize: 13.sp,
                ),
                Textwidget(
                  text: state.orderData?.totalCartPrice?.inRupeesFormat(),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                  text: "Delivery Charges",
                  fontSize: 13.sp,
                ),
                Textwidget(
                  text: "FREE Delivery",
                  fontSize: 14.sp,
                  color:Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Textwidget(
                  text: "Total Prize",
                  fontSize: 13.sp,
                ),
                Textwidget(
                  text: state.orderData?.totalCartPrice?.inRupeesFormat(),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  _customButtom() {
    return BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
        builder: (context, state) {
      if (state is DefaultAddressLoading) {
        return const SizedBox();
      }
      return BlocBuilder<OrderSummaryCubit, OrderSummaryState>(
        builder: (context, orderstate) {
          if (orderstate is OrderSummaryLoading) {
            return const SizedBox();
          }
          if (orderstate.orderData?.data == null) {
            return const SizedBox();
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.verticalScreen8pxPaddingPhone,
                horizontal: AppSizes.horizontalScreen20pxPaddingPhone),
            child: CustomButton(
              buttonTextSize: AppSizes.large16pxTextSize,
              buttonText: AppStrings.makePayment,
              onPress: () {
                context.push(
                  Routes.paymentScreen,
                  extra: {
                    "defaultAddress": state.defaultAddressResponseModel.data,
                    "orderedProduct": orderstate.orderData?.data,
                    "totalAmount": orderstate.orderData?.totalCartPrice,
                  },
                );
              },
            ),
          );
        },
      );
    });
  }
}
