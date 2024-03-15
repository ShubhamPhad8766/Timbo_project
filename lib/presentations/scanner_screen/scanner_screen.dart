import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/scanned_barcode/scan_barcode_cubit.dart';
import 'package:timbo/utils/extension/extension.dart';
import '../../logic/cart/cart_cubit.dart';
import '../../utils/app_utils/popUp/pop_up.dart';
import '../../utils/routes/routes.dart';
import '../../widgets/dotted_line.dart';
import '../../widgets/text_widget.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        Future.delayed(const Duration(seconds: 2), () {
          if (result?.code?.isNotEmpty ?? false) {
            context
                .read<BarCodeScanCubit>()
                .getProductByProductCode(result?.code);
          }
        });
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 320.h,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 216, 213, 213)),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Textwidget(
                            text: AppStrings.scanBarCode,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                          InkWell(
                            onTap: () {
                              context.push(Routes.cartScreen);
                            },
                            child: BlocBuilder<CartCubit, CartState>(
                              builder: (context, state) {
                                return Badge.count(
                                  count:
                                      state.data?.data?.products?.length ?? 0,
                                  largeSize: 16.sp,
                                  smallSize: 16.sp,
                                  textColor: Colors.white,
                                  textStyle: GoogleFonts.kumbhSans(
                                      color: Colors.white, fontSize: 12.sp),
                                  alignment: Alignment.topRight,
                                  backgroundColor: Colors.blue,
                                  offset: const Offset(8, -5),
                                  isLabelVisible:
                                      state is CartLoading ? false : true,
                                  child: Card(
                                    margin: EdgeInsets.zero,
                                    child: SizedBox(
                                      height: 35.h,
                                      width: 35.w,
                                      child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Icon(
                                            FontAwesomeIcons.bagShopping,
                                            size: 16.h,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: SizedBox(
                          height: 200.h,
                          child: QRView(
                            overlay: QrScannerOverlayShape(
                              borderColor: Colors.white,
                            ),
                            overlayMargin: EdgeInsets.all(20.h),
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller?.resumeCamera();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 13.h),
                          child: Textwidget(
                            text: AppStrings.tapToscan,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: BlocBuilder<BarCodeScanCubit, BarCodeScanState>(
                    builder: (context, state) {
                  if (state is BarCodeScanLoading) {
                    controller?.pauseCamera();
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is BarCodeScanSucess) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.verticalScreen8pxPaddingPhone,
                        horizontal: AppSizes.horizontalScreen12pxPaddingPhone,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 100.h * 2.75,
                            margin: EdgeInsets.zero,
                            alignment: Alignment.topCenter,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22.r),
                                  // bottomRight: Radius.circular(22.r)
                                ),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        state.productData?.mobilePictures?[0] ??
                                            ""))),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal:
                                  AppSizes.horizontalScreen8pxPaddingPhone,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Textwidget(
                                  text: state.productData?.name
                                      .toString()
                                      .capitalize(),
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 5.h),
                                DotWidget(
                                  dashColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  dashHeight: 1,
                                  dashWidth: 5,
                                  totalWidth: 322.w,
                                ),
                                SizedBox(height: 5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Textwidget(
                                                text: AppStrings.ourPrice,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    AppSizes.heavy18pxTextSize),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Textwidget(
                                              text: int.parse(state.productData
                                                          ?.buyingPrice
                                                          .toString() ??
                                                      "0")
                                                  .inRupeesFormat(),
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  AppSizes.heavy18pxTextSize,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Textwidget(
                                              text: AppStrings.mrp,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  AppSizes.medium14pxTextSize,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Textwidget(
                                              text: int.parse(state.productData
                                                          ?.sellingPrice
                                                          .toString() ??
                                                      "0")
                                                  .inRupeesFormat(),
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  AppSizes.large16pxTextSize,
                                              textDecoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                DotWidget(
                                  dashColor:
                                      Theme.of(context).secondaryHeaderColor,
                                  dashHeight: 1,
                                  dashWidth: 5,
                                  totalWidth: 322.w,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(height: 5.h),
                                Textwidget(
                                  text: state.productData?.description
                                      .toString()
                                      .capitalize(),
                                  fontSize: 13.sp,
                                ),
                                SizedBox(height: 5.h),
                                Container(
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          PopUpWidget.showPopup(
                                            context,
                                            'Product added to your cart','assets/json/check_animation.json'
                                            // 'Thank you for showing interst on this Product',
                                          );
                                          context.read<CartCubit>().addToCart(
                                              productId: state.productData?.id
                                                  .toString());
                                        },
                                        child: Textwidget(
                                          text: "Add To Cart",
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Textwidget(
                                        text: "Buy Now",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
