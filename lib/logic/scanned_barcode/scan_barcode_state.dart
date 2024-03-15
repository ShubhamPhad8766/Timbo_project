part of "scan_barcode_cubit.dart";

abstract class BarCodeScanState {
  ProductDataInBarcode? productData;
  BarCodeScanState(this.productData);
}

class BarCodeScanInitial extends BarCodeScanState {
  BarCodeScanInitial(super.productData);
}

class BarCodeScanLoading extends BarCodeScanState {
  BarCodeScanLoading(super.productData);
}

class BarCodeScanError extends BarCodeScanState {
  final String error;
  BarCodeScanError(this.error, super.productData);
}

class BarCodeScanSucess extends BarCodeScanState {
  BarCodeScanSucess(super.productData);
}
