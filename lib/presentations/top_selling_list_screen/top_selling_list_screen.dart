import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/constants/app_strings.dart';
import 'package:timbo/model/top_selling_product_response_model/top_selling_product_response_model.dart';
import 'package:timbo/widgets/top_selling_item_widget.dart';

import '../../constants/app_sizes.dart';
import '../../widgets/text_widget.dart';

class TopSellingListScreen extends StatelessWidget {
  const TopSellingListScreen({super.key, this.list});
  final List<TopSellingItem>? list;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Theme.of(context).secondaryHeaderColor),
          title: Textwidget(
            text: AppStrings.topSelling,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.large16pxTextSize,
          ),
        ),
        body: Column(children: [
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 5.w, crossAxisCount: 2),
              itemCount: list?.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(12.0.w),
                  child: TopSellingItemWidget(
                    item: list?[index],
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
