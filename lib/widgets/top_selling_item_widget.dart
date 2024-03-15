import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/model/top_selling_product_response_model/top_selling_product_response_model.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/text_widget.dart';
import 'package:timbo/utils/extension/extension.dart';

class TopSellingItemWidget extends StatelessWidget {
  const TopSellingItemWidget({super.key, this.item});

  final TopSellingItem? item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("${Routes.productDetailsScreen}/${item?.slug}",
            extra: item);
      },
      child: Container(
        padding: EdgeInsets.all(2.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                  width: 160.w,
                  fit: BoxFit.cover,
                  imageUrl: item?.pictures?[0] ?? ""),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                color: Theme.of(context).cardColor,
                width: 160.w,
                child: Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Textwidget(
                        text: item?.name?.capitalize() ?? "",
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: Theme.of(context).dividerColor,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Textwidget(
                            //text: item?.discountedPrice?.inRupeesFormat(),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          Textwidget(
                              //text: item?.buyingPrice?.inRupeesFormat(),
                              fontSize: 12.sp,
                              textDecoration: TextDecoration.lineThrough),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
