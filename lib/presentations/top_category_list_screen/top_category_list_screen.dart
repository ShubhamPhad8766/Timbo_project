import 'package:flutter/material.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/constants/app_strings.dart';

import 'package:timbo/model/top_category_response_model/top_category_response_model.dart';
import 'package:timbo/widgets/text_widget.dart';
import '../../widgets/top_category_item_widget.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key, this.list});
  final List<CategoryItem>? list;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          title: Textwidget(
            text: AppStrings.topCategories,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.large16pxTextSize,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.horizontalScreen12pxPaddingPhone),
          child: Column(children: [
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                padding: EdgeInsets.zero,
                itemCount: list?.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return TopCategoryItemWidget(
                    item: list?[index],
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
