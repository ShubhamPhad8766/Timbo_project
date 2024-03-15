import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/widgets/text_widget.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  context.pop(context);
                },
                child: Icon(
                  FontAwesomeIcons.chevronLeft,
                  size: 15.w,
                  color: Theme.of(context).secondaryHeaderColor,
                )),
            SizedBox(
              width: 10.w,
            ),
            Textwidget(
              text: AppStrings.cart,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
