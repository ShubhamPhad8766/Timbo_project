import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletons/skeletons.dart';

import '../constants/app_sizes.dart';

class CustomSkeletonLoader extends StatelessWidget {
  const CustomSkeletonLoader({
    super.key,
    required this.context,
    this.titleHeight,
    this.titleWidth,
    this.isTitleVisible = false,
    this.isGridView = false,
    this.gridColumnCount = 3,
    this.gridCount = 6,
    this.listViewCount = 6,
  });
  final BuildContext context;
  final bool isTitleVisible;
  final bool isGridView;
  final int? gridColumnCount;
  final int? titleHeight;
  final int? titleWidth;
  final int? gridCount;
  final int? listViewCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          isTitleVisible
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                          height: titleHeight?.h, width: titleWidth?.w),
                    ),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: titleHeight?.h,
                        width: titleWidth?.w,
                        padding: EdgeInsets.only(
                          right: AppSizes.horizontalScreen8pxPaddingPhone,
                        ),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          SizedBox(
            height: AppSizes.content12pxHeight,
          ),
          isGridView
              ? GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gridColumnCount ?? 0),
                  padding: EdgeInsets.zero,
                  itemCount: gridCount,
                  itemBuilder: (context, index) {
                    return SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: 50.h,
                        width: 40.w,
                        padding: EdgeInsets.only(
                          bottom: AppSizes.horizontalScreen8pxPaddingPhone,
                          right: AppSizes.horizontalScreen8pxPaddingPhone,
                        ),
                      ),
                    );
                  },
                )
              : SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: listViewCount,
                    itemBuilder: (context, index) {
                      return SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: 160.w,
                          padding: EdgeInsets.only(
                            bottom: AppSizes.horizontalScreen8pxPaddingPhone,
                            right: AppSizes.horizontalScreen8pxPaddingPhone,
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                )
        ],
      ),
    );
  }
}
