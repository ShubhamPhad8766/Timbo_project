import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/ordered_bill_response_model/ordered_bill_response_model.dart';
import '../../../repositories/order_repo/ordered_bill_repo.dart';

part 'ordered_bill_state.dart';

class OrderedBillCubit extends Cubit<OrderedBillState> {
  final OrdredBillRepo _billRepo = OrdredBillRepo();
  OrderedBillCubit() : super(OrderedBillInitial(OrdredModel()));

  void getOredredBillData(int id) async {
    try {
      emit(OrderedBillLoading(OrdredModel()));
      var response = await _billRepo.getOrededBillData(id);
      response.fold((error) {
        emit(OrderedBillError(error.message, state.ordredModel));
      }, (data) {
        emit(OrderedBillLoaded(data.data));
      });
    } catch (e) {
      emit(OrderedBillError(e.toString(), state.ordredModel));
    }
  }
}
