import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/cart/cart_cubit.dart';
import 'package:timbo/model/top_selling_product_response_model/top_selling_product_response_model.dart';
import 'package:timbo/utils/extension/extension.dart';
import 'package:timbo/widgets/custom_button.dart';
import '../../constants/app_colors.dart';
import '../../utils/app_utils/popUp/pop_up.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dotted_line.dart';
import '../../widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, this.item});
  final TopSellingItem? item;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CarouselController _carousalController = CarouselController();

  int _currentSlide = 0;
  String text = AppStrings.whatsappText;
  String mobile = AppStrings.sentOnWhatsAppNumber;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: IconThemeData(
            color: Theme.of(context).secondaryHeaderColor,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Textwidget(
                  text: widget.item?.name.toString().capitalize() ?? "",
                  fontSize: AppSizes.large16pxTextSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(Routes.cartScreen);
                },
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Badge.count(
                        count: state.data?.data?.products?.length ?? 0,
                        largeSize: 16.sp,
                        smallSize: 16.sp,
                        textColor: Colors.white,
                        textStyle: GoogleFonts.kumbhSans(
                            color: Colors.white, fontSize: 12.sp),
                        alignment: Alignment.topRight,
                        backgroundColor: Colors.blue,
                        offset: const Offset(8, -5),
                        isLabelVisible: state is CartLoading ? false : true,
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Icon(FontAwesomeIcons.bagShopping,
                                    size: 16.h, color: Colors.black),
                              )),
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 45.h,
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                borderRadius: 0.r,
                buttonText: AppStrings.addtoCart,
                onPress: () {
                  PopUpWidget.showPopup(
                    context,
                    'Product added to your cart','assets/json/check_animation.json'
                    // 'Thank you for showing interst on this Product',
                  );
                  context
                      .read<CartCubit>()
                      .addToCart(productId: widget.item?.id.toString());
                },
              )),
              Expanded(
                  child: CustomButton(
                borderRadius: 0.r,
                buttonText: AppStrings.orderonWhatsApp,
                onPress: () {
                  openWhatsApp(widget.item?.slug.toString() ?? "");
                },
              )),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 120.h * 2.75,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: _carousalController,
                            options: CarouselOptions(
                                onPageChanged: (index, _) {
                                  setState(() {
                                    _currentSlide = index;
                                  });
                                },
                                autoPlay:
                                    (widget.item?.mobilePictures?.length ?? 0) >
                                            1
                                        ? true
                                        : false,
                                autoPlayInterval: const Duration(seconds: 2),
                                aspectRatio: 16 / 9,
                                height: 330.h,
                                viewportFraction: 1),
                            itemCount: widget.item?.mobilePictures?.length ?? 0,
                            itemBuilder: (context, index, realIndex) {
                              var image = widget.item?.mobilePictures?[index];
                              return Opacity(
                                opacity: 0.8,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(22.r),
                                    bottomRight: Radius.circular(22.r),
                                  )),
                                  child: Container(
                                    height: 120.h * 2.75,
                                    margin: EdgeInsets.zero,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(22.r),
                                            bottomRight: Radius.circular(22.r)),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(image ?? ""))),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    if ((widget.item?.mobilePictures?.length ?? 0) > 1) ...{
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: widget.item!.mobilePictures!.map((imageUrl) {
                          int index =
                              widget.item!.mobilePictures!.indexOf(imageUrl);
                          return Container(
                            width: _currentSlide == index ? 20.0.w : 10.0.w,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 10.h),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6.w),
                              color: _currentSlide == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          );
                        }).toList(),
                      ),
                    }
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
                      vertical: AppSizes.verticalScreen12pxPaddingPhone),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Textwidget(
                              text: widget.item?.name.toString().capitalize() ??
                                  "",
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      DotWidget(
                        dashColor: Theme.of(context).secondaryHeaderColor,
                        dashHeight: 1,
                        dashWidth: 5,
                        totalWidth: 322.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Textwidget(
                                      text: AppStrings.ourPrice,
                                      fontWeight: FontWeight.bold,
                                      fontSize: AppSizes.heavy18pxTextSize),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Textwidget(
                                    text: int.parse(widget.item?.buyingPrice
                                                .toString() ??
                                            "0")
                                        .inRupeesFormat(),
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSizes.heavy18pxTextSize,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Textwidget(
                                    text: AppStrings.mrp,
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSizes.medium14pxTextSize,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Textwidget(
                                    text: int.parse(widget.item?.sellingPrice
                                                .toString() ??
                                            "0")
                                        .inRupeesFormat(),
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppSizes.large16pxTextSize,
                                    textDecoration: TextDecoration.lineThrough,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      DotWidget(
                        dashColor: Theme.of(context).secondaryHeaderColor,
                        dashHeight: 1,
                        dashWidth: 5,
                        totalWidth: 322.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Textwidget(
                        text: AppStrings.description,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.medium14pxTextSize,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Textwidget(
                        text:
                            widget.item?.description.toString().capitalize() ??
                                "",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.9),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      DotWidget(
                        dashColor: Theme.of(context).secondaryHeaderColor,
                        dashHeight: 1,
                        dashWidth: 5,
                        totalWidth: 322.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Textwidget(
                        text: AppStrings.variants,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                      SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: widget.item?.variants?.length ?? 0,
                          itemBuilder: (context, index) {
                            return Chip(
                              backgroundColor:
                                  AppColors.greenColor.withOpacity(0.9),
                              elevation: 0,
                              side: BorderSide.none,
                              label: Textwidget(
                                text: widget.item?.variants?[index].type,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                fontSize: 13.sp,
                                color: AppColors.whiteColor,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Textwidget(
                        text: AppStrings.features,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                      Chip(
                          backgroundColor: Colors.blueAccent,
                          label: Textwidget(
                            text:
                                widget.item?.features.toString().capitalize() ??
                                    "",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
    );
  }

  void openWhatsApp(String? productName) async {
    String message = "Customer wants to buy a this product";
    String url =
        "whatsapp://send?phone=+9657512780&text=baap.market/product-details/$productName $message";
    try {
      launchUrl(Uri.parse(url));
    } catch (e) {
      log("Error launching WhatsApp: $e");
    }
  }
}
