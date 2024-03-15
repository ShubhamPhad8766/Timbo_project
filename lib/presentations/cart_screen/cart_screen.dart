import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletons/skeletons.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/cart/cart_cubit.dart';
import 'package:timbo/model/cart_response_model/cart_response_model.dart';
import 'package:timbo/presentations/cart_screen/widgets/custom_appbar.dart';
import 'package:timbo/utils/extension/extension.dart';
import 'package:timbo/widgets/custom_button.dart';
import 'package:timbo/widgets/quantity_widget.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../../logic/address/default_address_cubit/default_address_cubit.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/custom_skeleton_loader.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final PanelController _panelController = PanelController();
  @override
  void initState() {
    context.read<CartCubit>().getCart();
    context.read<DefaultAddressCubit>().getDefaultAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightTheme.cardColor,
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state.data?.data?.products?.isEmpty ?? false) {
              return Container();
            }
            if (state is CartError) {
              return Container();
            }
            return SlidingUpPanel(
              renderPanelSheet: false,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
              backdropColor: AppColors.lightTheme.cardColor,
              defaultPanelState: PanelState.CLOSED,
              backdropEnabled: true,
              maxHeight: 160.h,
              minHeight: 160.h,
              isDraggable: true,
              controller: _panelController,
              collapsed: collapsedPanelWidget(),
              panel: openPanel(),
              body: cartBody(),
            );
          },
        ),
        appBar: const CartAppBar(),
      ),
    );
  }

  Widget openPanel() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return Container();
        }
        if (state.data != null) {
          return Card(
            margin: EdgeInsets.zero,
            elevation: 10,
            color: AppColors.lightTheme.cardColor,
            surfaceTintColor: AppColors.lightTheme.cardColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r))),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: AppSizes.horizontalScreen12pxPaddingPhone,
                      right: AppSizes.horizontalScreen12pxPaddingPhone),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSizes.verticalScreen5pxPaddingPhone),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Textwidget(
                              text: AppStrings.deliveryInstructions,
                              textAlign: TextAlign.center,
                              fontSize: AppSizes.medium14pxTextSize,
                              fontWeight: FontWeight.bold,
                            ),
                            Textwidget(
                              text: AppStrings.addNotes,
                              fontSize: AppSizes.small12pxTextSize,
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color:
                            AppColors.lightTheme.dividerColor.withOpacity(0.5),
                        height: 1,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textwidget(
                            text: AppStrings.subTotal,
                            textAlign: TextAlign.center,
                            fontSize: AppSizes.small12pxTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                          Textwidget(
                            text: "68",
                            fontSize: AppSizes.small12pxTextSize,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textwidget(
                            text: AppStrings.deliveryCost,
                            textAlign: TextAlign.center,
                            fontSize: AppSizes.small12pxTextSize,
                            fontWeight: FontWeight.bold,
                          ),
                          Textwidget(
                            text: "2",
                            fontSize: AppSizes.small12pxTextSize,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Divider(
                        color:
                            AppColors.lightTheme.dividerColor.withOpacity(0.5),
                        height: 1,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textwidget(
                            text: AppStrings.total,
                            textAlign: TextAlign.center,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.heavy18pxTextSize,
                          ),
                          Textwidget(
                            text: "70",
                            fontSize: AppSizes.heavy18pxTextSize,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  collapsedPanelWidget() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.data != null) {
          return Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            surfaceTintColor: AppColors.lightTheme.cardColor,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightTheme.cardColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color.fromARGB(255, 177, 187, 196),
                    height: 30.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              AppSizes.horizontalScreen12pxPaddingPhone),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Textwidget(
                                text: AppStrings.toPay,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSizes.medium14pxTextSize,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              if (state is QuantityLoading) ...{
                                Lottie.asset(
                                    'assets/json/loading_animation.json',
                                    fit: BoxFit.contain,
                                    frameRate: FrameRate(60)),
                              },
                              if (state.data?.totalCartPrice != null) ...{
                                Textwidget(
                                  text:
                                      "${state.data?.totalCartPrice?.toInt().inRupeesFormat()}",
                                  textAlign: TextAlign.center,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSizes.medium14pxTextSize,
                                )
                              },
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              _panelController.open();
                            },
                            child: Textwidget(
                              text: AppStrings.viewDetailedBill,
                              fontSize: AppSizes.small12pxTextSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      log("pressed.");
                    },
                    child:
                        BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
                      builder: (context, state) {
                        if (state is DefaultAddressLoading) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppSizes.horizontalScreen12pxPaddingPhone,
                              vertical: AppSizes.verticalScreen12pxPaddingPhone,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                        width: 250.w,
                                        height: 10.h,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    SkeletonAvatar(
                                      style: SkeletonAvatarStyle(
                                        width: 250.w,
                                        height: 30.h,
                                      ),
                                    ),
                                  ],
                                ),
                                SkeletonAvatar(
                                  style: SkeletonAvatarStyle(
                                      width: 60.w,
                                      padding: EdgeInsets.only(right: 10.w)),
                                ),
                              ],
                            ),
                          );
                        }
                        if (state.defaultAddressResponseModel.data == null) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Textwidget(
                                text: "Set Default Address",
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                  width: 80.w,
                                  height: 40.h,
                                  child: CustomButton(
                                    buttonText: AppStrings.add,
                                    buttonTextSize: AppSizes.large16pxTextSize,
                                    onPress: () {
                                      context.push(Routes.addressScreen);
                                    },
                                  )),
                            ],
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppSizes.horizontalScreen12pxPaddingPhone,
                              vertical: AppSizes.verticalScreen5pxPaddingPhone),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Textwidget(
                                        text: AppStrings.deliverTo,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        fontSize: AppSizes.medium14pxTextSize,
                                      ),
                                      Textwidget(
                                        text:
                                            " ${state.defaultAddressResponseModel.data?.tag} ",
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
                                        text:
                                            "${state.defaultAddressResponseModel.data?.city} ",
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
                                        text:
                                            "${state.defaultAddressResponseModel.data?.zip}",
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: AppSizes.medium14pxTextSize,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  context.push(Routes.addressScreen);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 177, 187, 196),
                                      borderRadius: BorderRadius.circular(8.r)),
                                  height: 35.h,
                                  width: 50.w,
                                  child: const Icon(
                                    FontAwesomeIcons.house,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
                    child: continueButtonButton(),
                  )
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  BlocBuilder<CartCubit, CartState> cartBody() {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartError) {
          return Center(
              child: Textwidget(
            text: state.error,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ));
        }
        if (state is CartLoading || state is QuantityLoading) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalScreen8pxPaddingPhone,
            ),
            child: CustomSkeletonCard(
              context: context,
              cardHeight: 100,
              listCount: 10,
            ),
          );
        }
        if (state.data?.data == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40.h),
              Textwidget(
                text: "Empty Cart",
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          );
        }
        if (state.data?.data != null) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: state.data?.data?.products?.length,
              itemBuilder: ((context, index) {
                var item = state.data?.data?.products?[index];
                return cartItems(item, index);
              }),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget applyCouponsButton() {
    return CustomButton(
      buttonText: AppStrings.applyCoupon,
    );
  }

  Widget continueButtonButton() {
    return BlocBuilder<DefaultAddressCubit, DefaultAddressState>(
      builder: (context, state) {
        if (state is DefaultAddressLoading) {
          return SkeletonAvatar(
            style: SkeletonAvatarStyle(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                    bottom: AppSizes.verticalScreen8pxPaddingPhone)),
          );
        }
        if (state.defaultAddressResponseModel.data == null) {
          return Container();
        }
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.verticalScreen5pxPaddingPhone),
          child: CustomButton(
            buttonTextSize: AppSizes.large16pxTextSize,
            buttonText: AppStrings.proceedToPay,
            onPress: () {
              context.push(Routes.orderSummaryScreen);
            },
          ),
        );
      },
    );
  }

  Widget cartItems(Product? item, int index) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              elevation: 0,
              color: AppColors.lightTheme.cardColor,
              surfaceTintColor: AppColors.lightTheme.cardColor,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey.shade300)),
                height: 100.h,
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
                                return Image.asset("assets/images/noimage.png",
                                    fit: BoxFit.contain);
                              },
                              fit: BoxFit.cover,
                              imageUrl: item?.productId?.pictures?.first ?? ""),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: AppSizes.content12pxHeight),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    text: item?.productId?.buyingPrice
                                        ?.toInt()
                                        .inRupeesFormat(),
                                    fontSize: AppSizes.medium14pxTextSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Textwidget(
                                    text: "x",
                                    fontSize: AppSizes.medium14pxTextSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Textwidget(
                                    text: item?.quantity.toString(),
                                    fontSize: AppSizes.medium14pxTextSize,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppSizes
                                          .verticalScreen8pxPaddingPhone),
                                  child: QuantityWidget(
                                    width: 0.25,
                                    quantity: item?.quantity ?? 0,
                                    showQtyText: false,
                                    onIncrementQuantity: (value) {
                                      state.data?.data?.products?[index]
                                          .quantity = value;
                                      context
                                          .read<CartCubit>()
                                          .updateCartProductById(
                                              state.data?.data?.id ?? "",
                                              product:
                                                  state.data?.data?.products);
                                    },
                                    onDecrementQuantity: (value) {
                                      context
                                          .read<CartCubit>()
                                          .updateCartProductById(
                                              state.data?.data?.id ?? "",
                                              product:
                                                  state.data?.data?.products);
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                  onPressed: () {
                    context.read<CartCubit>().deleteCartProductById(
                        state.data?.data?.id ?? "", item?.productId?.id ?? "");
                  },
                  icon: Icon(
                    FontAwesomeIcons.xmark,
                    color: Colors.grey,
                    size: 16.h,
                  )),
            )
          ],
        );
      },
    );
  }
}
