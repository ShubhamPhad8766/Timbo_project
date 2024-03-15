import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:timbo/model/order_summary_response_model/order_summary_response_model.dart';

import '../../model/jwt_token_response_model/jwt_token_response_model.dart';
import '../../repositories/order_summary_repo/order_summary_repo.dart';
import '../../utils/preferences/local_preferences.dart';
part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  final OrderSummaryRepo _orderSummaryRepo = OrderSummaryRepo();
  OrderSummaryCubit() : super(OrderSummaryInitial());

  void getOrderSummaryByUserId() async {
    try {
      emit(OrderSummaryLoading());
      var user = await LocalStorage.fetchToken();
      var userData = JwtDecoder.decode(user ?? "");
      var decodedToken = JwtTokeResponseModel.fromJson(userData);
      var response = await _orderSummaryRepo.getOrderSummaryDetails(
          userId: decodedToken.id.toString());
      response.fold((error) {
        emit(OrderSummaryError(error.message));
      }, (data) {
        emit(OrderSummaryLoaded(orderData: data));
      });
    } catch (e) {
      emit(OrderSummaryError(e.toString()));
    }
  }
}
