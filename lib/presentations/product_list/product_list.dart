import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/logic/product_list_cubit/productlist_cubit.dart';
import 'package:timbo/utils/extension/extension.dart';
import 'package:timbo/widgets/skeleton_loader_widget.dart';

import '../../widgets/text_widget.dart';
import '../../widgets/top_selling_item_widget.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.categoryName, this.categoryId});
  final String? categoryName;
  final String? categoryId;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    context.read<ProductListCubit>().getProductByCategoryId(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          title: Textwidget(
            text: widget.categoryName.toString().capitalize(),
            fontWeight: FontWeight.bold,
          ),
        ),
        body: BlocBuilder<ProductListCubit, ProductListState>(
          builder: (context, state) {
            if (state is ProductListLoading) {
              return Padding(
                padding: EdgeInsets.only(
                    left: AppSizes.horizontalScreen12pxPaddingPhone),
                child: CustomSkeletonLoader(
                  context: context,
                  isGridView: true,
                  gridColumnCount: 2,
                ),
              );
            }
            if (state.topSellingProductsResponseModel.data?.items?.isEmpty ??
                false) {
              return const Center(
                child: Textwidget(
                  text: AppStrings.noDataFound,
                ),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5.w, crossAxisCount: 2),
              itemCount:
                  state.topSellingProductsResponseModel.data?.items?.length ??
                      0,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(12.0.w),
                  child: TopSellingItemWidget(
                    item: state
                        .topSellingProductsResponseModel.data?.items?[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
