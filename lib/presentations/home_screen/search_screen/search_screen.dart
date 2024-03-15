import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/get_all_product_list/get_all_product_list_cubit.dart';
import 'package:timbo/logic/search_product/search_product_cubit.dart';
import 'package:timbo/widgets/skeleton_loader_widget.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../../../constants/app_sizes.dart';
import '../../../logic/top_category/top_category_cubit.dart';
import '../../../widgets/custom_circular_progress_indicator.dart';
import '../../../widgets/top_category_item_widget.dart';
import '../../../widgets/top_selling_item_widget.dart';

class SearchScreen extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      secondaryHeaderColor: Theme.of(context).scaffoldBackgroundColor,
      dividerColor: Theme.of(context).secondaryHeaderColor,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      shadowColor: Colors.white,
      textTheme: TextTheme(
          titleLarge: GoogleFonts.kumbhSans(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).secondaryHeaderColor)),
      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: GoogleFonts.kumbhSans(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).secondaryHeaderColor),
      ),
    );
  }

  @override
  String get searchFieldLabel => AppStrings.searchProduct;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Theme.of(context).secondaryHeaderColor),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:
          Icon(Icons.arrow_back, color: Theme.of(context).secondaryHeaderColor),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<SearchProductCubit>().clearProducts();
    if (query.length < 3) {
      return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Textwidget(
                text: AppStrings.searchErrorMessage,
                color: Colors.red,
              ),
            )
          ],
        ),
      );
    }
    context.read<SearchProductCubit>().searchProduct(query);
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
      if (state.items.isEmpty) {
        return const Center(
          child: Textwidget(
            text: AppStrings.noDataFound,
            color: Colors.red,
          ),
        );
      }
      return _productList(context, state);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          _topCategory(),
          SizedBox(
            height: 10.h,
          ),
          _getProductList(context),
        ],
      ),
    );
  }

  _getProductList(BuildContext context) {
    context.read<GetAllProductCubit>().getAllProduct();
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
    return Expanded(
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
          return const Center(
            child: CustomCircularProgressIndidator(),
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
              // return InkWell(
              //   onTap: (){

              //   },
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //         top: AppSizes.verticalScreen5pxPaddingPhone, left: 5.w),
              //     child: Card(
              //       color: Theme.of(context).scaffoldBackgroundColor,
              //       elevation: 10,
              //       margin: EdgeInsets.zero,
              //       child: Container(
              //         width: 100.w,
              //         padding: EdgeInsets.zero,
              //         decoration: BoxDecoration(
              //             color: AppColors.lightTheme.cardColor,
              //             borderRadius: BorderRadius.circular(8.r),
              //             border: Border.all(
              //                 color: Colors.grey.shade300, width: 0.5.h)),
              //         child: CachedNetworkImage(
              //           imageUrl: (item?.imageUrl ?? ""),
              //           fit: BoxFit.contain,
              //         ),
              //       ),
              //     ),
              //   ),
              // );
            },
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
