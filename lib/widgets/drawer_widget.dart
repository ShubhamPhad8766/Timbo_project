import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/logic/home/home_cubit.dart';
import 'package:timbo/widgets/text_widget.dart';

// import '../utils/routes/routes.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: 250.w,
        backgroundColor: Colors.white,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(0)
        // ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalScreen12pxPaddingPhone,
            vertical: AppSizes.verticalScreen20pxPaddingPhone,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              menuItems(
                  text: "Home",
                  icon: FontAwesomeIcons.house,
                  onTap: () {
                    context
                        .read<HomeCubit>()
                        .drawerKey
                        .currentState
                        ?.closeDrawer();
                  }),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "Shop By Category",
                  icon: FontAwesomeIcons.cartArrowDown,
                  onTap: () {}),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
                child: Textwidget(
                    text: "My Account",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.medium14pxTextSize),
              ),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "My Orders",
                  icon: FontAwesomeIcons.list,
                  onTap: () {
                    // context.push(Routes.myOrdersScreen);
                  }),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "My Favorites",
                  icon: FontAwesomeIcons.heart,
                  onTap: () {}),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "My WishList",
                  icon: FontAwesomeIcons.thinkPeaks,
                  onTap: () {}),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "My Wallet",
                  icon: FontAwesomeIcons.wallet,
                  onTap: () {}),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.verticalScreen8pxPaddingPhone,
                    horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
                child: Textwidget(
                    text: "Offers & More",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.medium14pxTextSize),
              ),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "Offers Store",
                  icon: FontAwesomeIcons.house,
                  onTap: () {}),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "Coupons Store",
                  icon: FontAwesomeIcons.fileContract,
                  onTap: () {}),
              SizedBox(
                height: 10.h,
              ),
              menuItems(
                  text: "Gifts Store",
                  icon: FontAwesomeIcons.gift,
                  onTap: () {}),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
                child: Textwidget(
                    text: "Baap Market v0.1",
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.medium14pxTextSize),
              )
            ],
          ),
        ),
      ),
    );
  }

  menuItems(
      {required Function onTap, required IconData icon, required String text}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
                child: Icon(icon, color: Colors.black, size: 18.h),
              ),
              Textwidget(
                  text: text,
                  color: Colors.black,
                  fontSize: AppSizes.small12pxTextSize),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 2.h,
              horizontal: AppSizes.horizontalScreen12pxPaddingPhone,
            ),
            child: Divider(
              color: Theme.of(context).dividerColor,
              thickness: 1.h,
            ),
          )
        ],
      ),
    );
  }
}
