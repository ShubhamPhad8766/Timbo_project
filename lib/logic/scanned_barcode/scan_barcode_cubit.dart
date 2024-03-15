import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timbo/repositories/scanner_repo/scanner_repo.dart';

import '../../model/scanner_code_response_model/scanner_code_response_model.dart';

part 'scan_barcode_state.dart';

class BarCodeScanCubit extends Cubit<BarCodeScanState> {
  final BarCodeRepo _barCodeRepo = BarCodeRepo();
  BarCodeScanCubit() : super(BarCodeScanInitial(ProductDataInBarcode()));

  void getProductByProductCode(String? productCode) async {
    try {
      emit(BarCodeScanLoading(ProductDataInBarcode()));
      var response = await _barCodeRepo.getScannedData(productCode);
      response.fold((error) {
        emit(BarCodeScanError(error.message, state.productData));
      }, (data) {
        emit(BarCodeScanSucess(data.data));
      });
    } catch (e) {
      emit(BarCodeScanError(e.toString(), state.productData));
    }
  }
}
