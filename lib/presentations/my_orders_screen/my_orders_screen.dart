import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timbo/constants/app_sizes.dart';
import 'package:timbo/logic/order/my_orders/my_order_cubit.dart';
import 'package:timbo/widgets/custom_circular_progress_indicator.dart';

import '../../constants/app_strings.dart';
import '../../utils/app_utils/app_utils/app_utils.dart';
import '../../widgets/order_item_widget.dart';
import '../../widgets/text_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final List<String> _productUrl = [
    "https://5.imimg.com/data5/ANDROID/Default/2022/4/AF/PJ/BI/56664663/product-jpeg-500x500.jpg",
    "https://m.media-amazon.com/images/I/81Ekhr5nHKL._SL1500_.jpg",
    "https://m.media-amazon.com/images/I/61lUcSQCl6L._SX466_.jpg",
  ];

  final List<String> _productName = [
    "amul baffelo feed",
    "Utkarsh nematoz-p",
    "Ugaoo Organic -v"
  ];

  @override
  void initState() {
    context.read<MyOrderCubit>().getMyOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        systemOverlayStyle: systemOverLayStyle,
        iconTheme: IconThemeData(color: Theme.of(context).secondaryHeaderColor),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Textwidget(
          fontSize: 18.sp,
          text: AppStrings.myOrders,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.horizontalScreen12pxPaddingPhone,
          vertical: AppSizes.verticalScreen8pxPaddingPhone,
        ),
        child: SingleChildScrollView(
          child: BlocBuilder<MyOrderCubit, MyOrderState>(
            builder: (context, state) {
              if (state is MyOrderLoading) {
                return const Center(
                  child: CustomCircularProgressIndidator(),
                );
              }
              return Column(
                children: [
                  // TextformFieldWidget(
                  //   hintText: "Search Product",
                  //   fontSize: 14.sp,
                  //   onChanged: (value) {
                  //     log(value);
                  //   },
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 400.h,
                    child: ListView.builder(
                        itemCount: _productName.length,
                        itemBuilder: (context, index) {
                          return OrderListTile(
                            imageUrl: _productUrl[index],
                            imageName: _productName[index],
                            deliveryDate: "Delivery on 31 Aug",
                          );
                        }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
