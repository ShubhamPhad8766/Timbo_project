part of "ordered_bill_cubit.dart";

abstract class OrderedBillState {
  OrdredModel? ordredModel;
  OrderedBillState(this.ordredModel);
}

class OrderedBillInitial extends OrderedBillState {
  OrderedBillInitial(super.ordredModel);
}

class OrderedBillLoading extends OrderedBillState {
  OrderedBillLoading(super.ordredModel);
}

class OrderedBillLoaded extends OrderedBillState {
  OrderedBillLoaded(super.ordredModel);
}

class OrderedBillError extends OrderedBillState {
  final String error;
  OrderedBillError(this.error, super.ordredModel);
}
