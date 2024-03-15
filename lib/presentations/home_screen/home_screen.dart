// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/constants/app_colors.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/logic/cart/cart_cubit.dart';
import 'package:timbo/logic/home/home_cubit.dart';
import 'package:timbo/logic/profile/profile_cubit.dart';
import 'package:timbo/presentations/home_screen/tabs/search_screen/search_screen_tab.dart';
import 'package:timbo/utils/routes/routes.dart';
import 'package:timbo/widgets/drawer_widget.dart';
import 'tabs/home_screen/home_content.dart';
import 'tabs/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> navbaritems = [
    "assets/icons/home.svg",
    "assets/icons/bx-search-alt.svg",
    "assets/icons/truck2.svg",
    "assets/icons/user-profile.svg"
  ];

  @override
  void initState() {
    context.read<HomeCubit>().getNavBarItem(NavbarItem.home);
    context.read<ProfileCubit>().getUserProfileData();
    context.read<CartCubit>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          key: context.read<HomeCubit>().drawerKey,
          drawer: const DrawerWidget(),
          backgroundColor: AppColors.lightTheme.cardColor,
          extendBody: true,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.r)),
            backgroundColor: AppColors.lightTheme.cardColor,
            child: const Icon(FontAwesomeIcons.barcode, color: Colors.black),
            onPressed: () {
              context.push(Routes.scannerScreen);
            },
          ),
          bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return BottomAppBar(
                elevation: 0,
                height: AppSizes.height(55),
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: const CircularNotchedRectangle(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.horizontalScreen8pxPaddingPhone),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .getNavBarItem(NavbarItem.home);
                        },
                        icon: SvgPicture.asset(
                          navbaritems[0],
                          color: state.index == 0
                              ? Theme.of(context).secondaryHeaderColor
                              : Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .getNavBarItem(NavbarItem.search);
                        },
                        icon: SvgPicture.asset(
                          allowDrawingOutsideViewBox: true,
                          navbaritems[1],
                          color: state.index == 1
                              ? Theme.of(context).secondaryHeaderColor
                              : null,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .getNavBarItem(NavbarItem.truck);
                        },
                        icon: SvgPicture.asset(
                          navbaritems[2],
                          color: state.index == 2
                              ? Theme.of(context).secondaryHeaderColor
                              : null,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context
                              .read<HomeCubit>()
                              .getNavBarItem(NavbarItem.profile);
                        },
                        icon: SvgPicture.asset(
                          navbaritems[3],
                          color: state.index == 3
                              ? Theme.of(context).secondaryHeaderColor
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state.navbarItem == NavbarItem.home) {
              return const HomeContent();
            } else if (state.navbarItem == NavbarItem.search) {
              return const SearchScreenBottom();
            } else if (state.navbarItem == NavbarItem.profile) {
              return const ProfileScreen();
            } else if (state.navbarItem == NavbarItem.truck) {
              return const Scaffold();
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
