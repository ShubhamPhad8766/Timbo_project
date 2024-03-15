import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/widgets/text_widget.dart';

import '../constants/app_sizes.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    this.imageUrl,
    this.imageName,
    this.deliveryDate,
  });

  final String? imageUrl;
  final String? imageName;
  final String? deliveryDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.verticalScreen5pxPaddingPhone,
      ),
      child: InkWell(
        // onTap: (){
        //   context.push(Routes.orderedDetailsScreen, extra: {
        //     "orderId": "2144322",
        //   });
        // },
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.verticalScreen8pxPaddingPhone,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5.w,
              ),
              _imageWidget(),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                width: 160.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Textwidget(
                      text: deliveryDate,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Textwidget(
                      text: imageName,
                      fontSize: 14.sp,
                      textOverflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                size: 25.h,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _imageWidget() {
    return SizedBox(
      width: 80.w,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        fit: BoxFit.cover,
        height: 100.h,
      ),
    );
  }
}
