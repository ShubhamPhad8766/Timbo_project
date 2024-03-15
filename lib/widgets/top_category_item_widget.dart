import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/model/top_category_response_model/top_category_response_model.dart';
import '../utils/routes/routes.dart';

class TopCategoryItemWidget extends StatelessWidget {
  const TopCategoryItemWidget({super.key, this.item});
  final CategoryItem? item;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('${Routes.productListScreen}/${item?.name}', extra: {
          "categoryName": item?.name ?? "",
          "categoryId": item?.id ?? ""
        });
      },
      child: Padding(
        padding: EdgeInsets.all(AppSizes.verticalScreen5pxPaddingPhone),
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          margin: EdgeInsets.zero,
          child: Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: AppColors.lightTheme.cardColor,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.grey.shade300, width: 0.5.h)),
            child: CachedNetworkImage(
              imageUrl: (item?.imageUrl ?? ""),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
