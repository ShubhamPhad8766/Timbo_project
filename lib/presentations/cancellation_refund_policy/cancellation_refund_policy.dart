import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_sizes.dart';
import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../widgets/text_widget.dart';

class CancellationRefundPolicy extends StatefulWidget {
  const CancellationRefundPolicy({super.key});

  @override
  State<CancellationRefundPolicy> createState() =>
      _CancellationRefundPolicyState();
}

class _CancellationRefundPolicyState extends State<CancellationRefundPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: systemOverLayStyle,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Textwidget(
          fontSize: 18.sp,
          text: AppStrings.cancellationRefundPolicy,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Scrollbar(
          thickness: 4.0,
          thumbVisibility: true,
          radius: Radius.circular(15.r),
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Textwidget(
                          fontSize: AppSizes.medium14pxTextSize,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.justify,
                          text: "Cancellation Policy",
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                          fontSize: AppSizes.small12pxTextSize,
                          textAlign: TextAlign.justify,
                          text:
                              "If a customer changes their mind and wants to cancel the order, then they have to contact our Customer Care executive. The cancellation will not be valid until it is confirmed by our respective department.",
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                          fontSize: AppSizes.small12pxTextSize,
                          textAlign: TextAlign.justify,
                          text:
                              "Cancellation requests will be considered only if the product is not dispatched. Once the order is shipped, customer cannot cancel the order.",
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                                "If the customer has placed an order through Online Payment and cancels the order, then we will process for a refund within 7 working days."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                          fontSize: AppSizes.medium14pxTextSize,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.justify,
                          text: "Refund Policy",
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 A refund will be considered only if the request is made within 7 days of placing an order. (If the product is damaged, Duplicate or quantity varies)."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 Goods once Supplied will not be taken back or exchanged, if there is not defect in product."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 The return will be processed only if:"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "1. It is determined that the product was not damaged while in your possession"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "2. The product is not different from what was shipped to you"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "2. The product is not different from what was shipped to you"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "3. The product is returned in its original condition"),
                        SizedBox(
                          height: 5.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "4. Customer must take an unboxing video."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 In case of receipt of damaged or defective items please report the same to our Customer Service team. The request will, however, be entertained once the merchant has checked and determined the same at his own end. This should be reported within 48 hours of receipt of the products."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 In case you feel that the product received is not as shown on the site or as per your expectations, you must bring it to the notice of our customer service within 24 hours of receiving the product. The Customer Service Team after looking into your complaint will take an appropriate decision."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 NOTE: If you have done an online payment and you are cancelling the order, the payment gateway charge 3% and courier charge (Forward + Return) will be deducted from your refund amount. If you have ordered and product is in transit (shipped) we will charge 3% and courier charge (Forward + Return) from you."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "\u2022 Its your responsibility to take out print of the manifest that BAAP Experience Centre provides, while returning the product."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            text:
                            "Please note the dose that is given are just for reference and we do not claim or take any responsibility for the exact dose and we do not provide any schedule for your crops, plants, or trees"),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,
                            fontWeight: FontWeight.bold,
                            text:
                            "No Warranty on Live Plants as Growing, flowering and fruiting are subject to So many climatic condition like Air, Kind of soil, water, humidity and temperature beyond our control."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,

                            text:
                            "Kindly note that refund will be made only after proper investigation of the whole scenario by our special team."),
                        SizedBox(
                          height: 10.h,
                        ),
                        Textwidget(
                            fontSize: AppSizes.small12pxTextSize,
                            textAlign: TextAlign.justify,

                            text:
                            "BAAP Experience Centre reserve the rights to change or update the terms and conditions at any time with or without any prior notice. To make sure you are always updated of the terms and conditions, please review this website periodically."),
                        SizedBox(
                          height: 20.h,
                        ),
                      ])))),
    );
  }
}
