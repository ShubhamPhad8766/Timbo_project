part of 'my_order_cubit.dart';

abstract class MyOrderState {
  final List<MyOrderModel> myOrderModel;
  const MyOrderState(this.myOrderModel);
}

class MyOrderInitial extends MyOrderState {
  const MyOrderInitial(super.myOrderModel);
}

class MyOrderLoading extends MyOrderState {
  MyOrderLoading(super.myOrderModel);
}


class MyOrderLoaded extends MyOrderState {
  MyOrderLoaded(super.myOrderModel);
}

class MyOrderError extends MyOrderState {
  final String error;
  MyOrderError(this.error, super.myOrderModel);
}
