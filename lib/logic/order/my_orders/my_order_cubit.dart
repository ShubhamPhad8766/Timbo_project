import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timbo/repositories/order_repo/my_order_repo.dart';
import 'package:timbo/utils/preferences/local_preferences.dart';

import '../../../model/order_models/my_order_response_model/my_order_response_model.dart';

part 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  final MyOrderRepo _myOrderRepo = MyOrderRepo();
  MyOrderCubit() : super(const MyOrderInitial(([])));

  void getMyOrders() async {
    try {
      emit(MyOrderLoading([]));
      String? userId = LocalStorage.tokenResponseModel.id;
      var data = await _myOrderRepo.getMyOrders(userId);
      data.fold((error) {}, (data) {
        emit(MyOrderLoaded(data.data?.items ?? []));
      });
    } catch (e) {
      emit(MyOrderError(e.toString(), []));
    }
  }
}
