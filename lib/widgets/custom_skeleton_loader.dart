import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

import '../constants/app_sizes.dart';

class CustomSkeletonCard extends StatelessWidget {
  const CustomSkeletonCard({
    super.key,
    required this.context,
    this.cardHeight = 20,
    this.cardWidth = 50,
    this.listCount,
  });
  final BuildContext context;
  final double? cardHeight;
  final double? cardWidth;
  final int? listCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          itemCount: listCount,
          itemBuilder: (context, index) {
            return SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: cardWidth?.w,
                height: cardHeight?.h,
                padding: EdgeInsets.only(
                  bottom: AppSizes.horizontalScreen8pxPaddingPhone,
                  right: AppSizes.horizontalScreen8pxPaddingPhone,
                ),
              ),
            );
          }),
    );
  }
}
