// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbo/constants/app_images.dart';
import 'package:timbo/widgets/textformfield_widget.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/app_strings.dart';
import '../../../../logic/cart/cart_cubit.dart';
import '../../../../logic/get_all_product_list/get_all_product_list_cubit.dart';
import '../../../../logic/home/home_cubit.dart';
import '../../../../logic/search_product/search_product_cubit.dart';
import '../../../../logic/top_category/top_category_cubit.dart';
import '../../../../utils/routes/routes.dart';
import '../../../../widgets/skeleton_loader_widget.dart';
import '../../../../widgets/text_widget.dart';
import '../../../../widgets/top_category_item_widget.dart';
import '../../../../widgets/top_selling_item_widget.dart';

class SearchScreenBottom extends StatefulWidget {
  const SearchScreenBottom({super.key});

  @override
  State<SearchScreenBottom> createState() => _SearchScreenBottomState();
}

class _SearchScreenBottomState extends State<SearchScreenBottom> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    context.read<SearchProductCubit>().getAllProduct();
    context.read<TopCategoryCubit>().getTopcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSearchActive =
        context.watch<SearchProductCubit>().state is! SearchProductInitial;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70.h),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppSizes.verticalScreen8pxPaddingPhone,
              horizontal: AppSizes.horizontalScreen20pxPaddingPhone),
          child: Row(
            children: [
              InkWell(
                child: SvgPicture.asset(
                  AppImages.menuBarImage,
                  width: 15.w,
                  height: 15.h,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                onTap: () {
                  context
                      .read<HomeCubit>()
                      .drawerKey
                      .currentState
                      ?.openDrawer();
                },
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: TextformFieldWidget(
                  hintText: AppStrings.searchProduct,
                  hintTextColor: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.bold,
                  rouneded: 16.r,
                  height: 40.h,
                  fontSize: 12.sp,
                  controller: searchController,
                  isSuffixIconShow: true,
                  suffixIcon: AppImages.clearIcon,
                  suffixIconClick: () {
                    context.read<SearchProductCubit>().getAllProduct();
                    searchController.clear();
                  },
                  onChanged: (value) {
                    if (value.length > 3) {
                      context.read<SearchProductCubit>().searchProduct(value);
                    } else {
                      context.read<SearchProductCubit>().getAllProduct();
                    }
                  },
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              InkWell(
                onTap: () {
                  context.push(Routes.cartScreen);
                },
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Badge.count(
                        count: state.data?.data?.products?.length ?? 0,
                        largeSize: 16.sp,
                        smallSize: 16.sp,
                        textColor: Colors.white,
                        textStyle: GoogleFonts.kumbhSans(
                            color: Colors.white, fontSize: 12.sp),
                        alignment: Alignment.topRight,
                        backgroundColor: Colors.blue,
                        offset: const Offset(8, -5),
                        isLabelVisible: state is CartLoading ? false : true,
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: SizedBox(
                              height: 35.h,
                              width: 35.w,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Icon(FontAwesomeIcons.bagShopping,
                                    size: 16.h, color: Colors.black),
                              )),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppSizes.content12pxHeight,
              ),
              _topCategory(),
              SizedBox(
                height: AppSizes.content12pxHeight,
              ),
              _searchProductList(context, isSearchActive),
              _getProductList(context),
            ],
          ),
        ),
      ),
    );
  }

  _searchProductList(BuildContext context, bool isSearchActive) {
    return BlocBuilder<SearchProductCubit, SearchProductState>(
        builder: (context, state) {
      if (state is SearchProductLoading) {
        return Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomSkeletonLoader(
            gridColumnCount: 2,
            gridCount: 4,
            isGridView: true,
            context: context,
          ),
        );
      }
      if (isSearchActive && state.items.isEmpty) {
        return const Center(
          child: Textwidget(
            fontWeight: FontWeight.w600,
            text: AppStrings.noDataFound,
            color: Colors.red,
          ),
        );
      }
      if (isSearchActive) {
        return _productList(context, state);
      }
      return const SizedBox();
    });
  }

  _getProductList(BuildContext context) {
    return BlocBuilder<GetAllProductCubit, GetAllProductState>(
        builder: (context, state) {
      if (state is GetAllProductLoading) {
        return Padding(
          padding: EdgeInsets.only(left: 10.h),
          child: CustomSkeletonLoader(
            gridColumnCount: 2,
            gridCount: 4,
            isGridView: true,
            context: context,
          ),
        );
      }
      return _productList(context, state);
    });
  }

  _productList(BuildContext context, state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 5.w,
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.zero,
        itemCount: state.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.w),
            child: TopSellingItemWidget(
              item: state.items?[index],
            ),
          );
        },
      ),
    );
  }

  _topCategory() {
    return BlocBuilder<TopCategoryCubit, TopCategoryState>(
      builder: (context, state) {
        if (state is TopCategoryLoading) {
          return Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: CustomSkeletonLoader(
              context: context,
              gridColumnCount: 2,
              gridCount: 4,
              isGridView: false,
            ),
          );
        }
        if (state is TopCategoryError) {
          return Center(
            child: Textwidget(text: state.error),
          );
        }
        if (state.items?.isEmpty ?? false) {
          return const SizedBox();
        }
        return Container(
          margin: EdgeInsets.only(
              bottom: AppSizes.horizontalScreen8pxPaddingPhone,
              top: AppSizes.horizontalScreen8pxPaddingPhone,
              left: 3.w),
          height: 120.h,
          child: ListView.builder(
            itemCount: state.items?.length,
            itemBuilder: (context, index) {
              var item = state.items?[index];
              return TopCategoryItemWidget(
                item: item,
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
