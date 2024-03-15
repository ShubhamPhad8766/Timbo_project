// ignore_for_file: must_be_immutable

part of 'order_summary_cubit.dart';

@immutable
abstract class OrderSummaryState {
  OrderSummaryModel? orderData;
  OrderSummaryState({this.orderData});
}

class OrderSummaryInitial extends OrderSummaryState {
  OrderSummaryInitial({super.orderData});
}

class OrderSummaryLoaded extends OrderSummaryState {
  OrderSummaryLoaded({super.orderData});
}

class OrderSummaryLoading extends OrderSummaryState {
  OrderSummaryLoading({super.orderData});
}

class OrderSummaryError extends OrderSummaryState {
  final String? errorMesage;
  OrderSummaryError(this.errorMesage, {super.orderData});
}
