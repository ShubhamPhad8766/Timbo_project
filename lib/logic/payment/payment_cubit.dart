import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:timbo/repositories/payment_repo/payment_repo.dart';

import '../../model/order_summary_response_model/order_summary_response_model.dart';
import '../../utils/routes/routes.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentRepo _paymentRepo = PaymentRepo();
  PaymentCubit() : super(PaymentInitial());

  void savePayment({
    String? userId,
    String? userName,
    String? addressId,
    String? street,
    String? zip,
    String? city,
    String? state,
    String? locality,
    String? paymentMode,
    String? currentDate,
    int? totalAmount,
    List<Product>? products,
    BuildContext? context,
  }) async {
    var data = {
      "groupId": 1687348063136,
      // "customer": {
      //   "name": userName,
      // },
      "userId": userId,
      "products": products,
      "total_amount": totalAmount,
      "currency": "Rs",
      "status": "new",
      "date": currentDate,
      "source": "MobileApp",
      "paymentInfo": {
        "mode": paymentMode
        // "transaction_id": "u324324hjkheer",
        // "date_of_transaction": "2323213",
        // "amount_paid": "2233",
        // "Balance": "239",
        // "paid": false
      },
      "delivery_info": {
        "shipping_address": {
          "id": addressId,
          "street": street,
          "locality": locality,
          "city": city,
          "state": state,
          "zip": zip
        },
      }
    };
    emit(PaymentLoading());
    var response = await _paymentRepo.savePayment(data: data);
    response.fold((error) {
      emit(PaymentError(error.message));
    }, (data) {
      log("${data.data?.orderId.toString()} ............,");
      context?.push(Routes.orderBillScreen, extra: {
        "orderId": data.data?.orderId,
      });
      emit(PaymentSuccess());
    });
  }
}
