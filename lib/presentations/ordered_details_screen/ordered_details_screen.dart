import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/utils/extension/extension.dart';

import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../widgets/text_widget.dart';

class OrderedDetailsScreen extends StatefulWidget {
  const OrderedDetailsScreen({
    super.key,
    this.orderedId,
  });

  final String? orderedId;

  @override
  State<OrderedDetailsScreen> createState() => _OrderedDetailsScreenState();
}

class _OrderedDetailsScreenState extends State<OrderedDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    log(widget.orderedId ?? "");
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: systemOverLayStyle,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Textwidget(
          fontSize: 18.sp,
          text: AppStrings.orderedDetails,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalScreen20pxPaddingPhone,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textwidget(
              text: "Order ID - ${widget.orderedId}",
            ),
            const Divider(),
            SizedBox(
              height: AppSizes.content8pxHeight,
            ),
            _productDetailsWidget(),
            const Divider(),
            _deliveryStatus(),
            const Divider(),
            _deliveryAddress(),
          ],
        ),
      ),
    );
  }

  _productDetailsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textwidget(
              text: 'Utkarsh nematoz-p',
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),

            // Selected Variant
            Textwidget(
              text: '1 kg',
              fontSize: 13.sp,
            ),
            SizedBox(
              height: 8.h,
            ),
            // Price
            Textwidget(
              text: 1000.inRupeesFormat(),
              fontSize: 13.sp,
            ),
          ],
        ),
        SizedBox(
          width: 100.w,
          child: CachedNetworkImage(
            imageUrl:
                "https://m.media-amazon.com/images/I/81Ekhr5nHKL._SL1500_.jpg",
            height: 80.h,
            width: 100.w,
          ),
        ),
      ],
    );
  }

  _deliveryStatus() {
    return OrderTrackerZen(
      // Provide an array of TrackerData objects to display the order tracking information.
      tracker_data: [
        // TrackerData represents a single step in the order tracking process.
        TrackerData(
          title: "Order Placed",
          date: "Sat, 8 Apr '22",
          // Provide an array of TrackerDetails objects to display more details about this step.
          tracker_details: [
            // TrackerDetails contains detailed information about a specific event in the order tracking process.
            TrackerDetails(
              title: "Your order was placed on Zenzzen",
              datetime: "Sat, 8 Apr '22 - 17:17",
            ),
            TrackerDetails(
              title: "Zenzzen Arranged A Callback Request",
              datetime: "Sat, 8 Apr '22 - 17:42",
            ),
          ],
        ),
        // yet another TrackerData object
        TrackerData(
          title: "Order Shipped",
          date: "Sat, 8 Apr '22",
          tracker_details: [
            TrackerDetails(
              title: "Your order was shipped with MailDeli",
              datetime: "Sat, 8 Apr '22 - 17:50",
            ),
          ],
        ),
        // And yet another TrackerData object
        TrackerData( 
          title: "Order Delivered",
          date: "Sat,8 Apr '22",
          tracker_details: [
            TrackerDetails(
              title: "You received your order, by MailDeli",
              datetime: "Sat, 8 Apr '22 - 17:51",
            ),
          ],
        ),
      ],
    );

    //   Row(children: [
    //     SizedBox(
    //       // width: 40.w,
    //       // child: Column(
    //       //   mainAxisAlignment: MainAxisAlignment.start,
    //       //   crossAxisAlignment: CrossAxisAlignment.start,
    //       //   children: [
    //       //     Checkbox(
    //       //       value: true,
    //       //       onChanged: (value) {
    //       //         setState(() {
    //       //           value != value;
    //       //         });
    //       //       },
    //       //     ),
    //       //     Checkbox(
    //       //       value: true,
    //       //       onChanged: (value) {
    //       //         setState(() {
    //       //           value != value;
    //       //         });
    //       //       },
    //       //     ),
    //       //   ],
    //       // ),
    //       child: OrderTrackerZen(
    //         // Provide an array of TrackerData objects to display the order tracking information.
    //         tracker_data: [
    //           // TrackerData represents a single step in the order tracking process.
    //           TrackerData(
    //             title: "Order Placed",
    //             date: "Sat, 8 Apr '22",
    //             // Provide an array of TrackerDetails objects to display more details about this step.
    //             tracker_details: [
    //               // TrackerDetails contains detailed information about a specific event in the order tracking process.
    //               TrackerDetails(
    //                 title: "Your order was placed on Zenzzen",
    //                 datetime: "Sat, 8 Apr '22 - 17:17",
    //               ),
    //               TrackerDetails(
    //                 title: "Zenzzen Arranged A Callback Request",
    //                 datetime: "Sat, 8 Apr '22 - 17:42",
    //               ),
    //             ],
    //           ),
    //           // yet another TrackerData object
    //           TrackerData(
    //             title: "Order Shipped",
    //             date: "Sat, 8 Apr '22",
    //             tracker_details: [
    //               TrackerDetails(
    //                 title: "Your order was shipped with MailDeli",
    //                 datetime: "Sat, 8 Apr '22 - 17:50",
    //               ),
    //             ],
    //           ),
    //           // And yet another TrackerData object
    //           TrackerData(
    //             title: "Order Delivered",
    //             date: "Sat,8 Apr '22",
    //             tracker_details: [
    //               TrackerDetails(
    //                 title: "You received your order, by MailDeli",
    //                 datetime: "Sat, 8 Apr '22 - 17:51",
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     SizedBox(width: AppSizes.horizontalScreen5pxPaddingPhone),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Textwidget(
    //           text: "Order Confirmed on 14 Aug",
    //           textOverflow: TextOverflow.ellipsis,
    //           fontSize: 14.sp,
    //         ),
    //         SizedBox(
    //           height: 20.h,
    //         ),
    //         Textwidget(
    //           text: "Cancelled on 15 Aug",
    //           textOverflow: TextOverflow.ellipsis,
    //           fontSize: 14.sp,
    //         ),
    //       ],
    //     ),
    //   ]),
    // );
  }

  _deliveryAddress() {
    return Container();
  }
}
