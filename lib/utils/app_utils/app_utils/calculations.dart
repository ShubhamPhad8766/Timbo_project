

import '../../../model/cart_response_model/cart_response_model.dart';

class Calculations {
  // static double get amount => amountToBePay([]);
  //
  static double cartTotal({required List<Product> items}) {
    double total = 0;

    for (int i = 0; i < (items.length); i++) {
      total += (items[i].productId?.buyingPrice)! * (items[i].quantity?.toInt()??0);
    }

    return total;
  }

  // static double discountValue(List<CartItemModel> items, double value) {
  //   double total = 0;
  //
  //   for (int i = 0; i < items.length; i++) {
  //     total += items[i].product!.price! * items[i].quantity!;
  //   }
  //
  //   return total * value;
  // }
  //
  // static taxValue(List<CartItemModel> items, double value) {
  //   double total = 0;
  //
  //   for (int i = 0; i < items.length; i++) {
  //     total += items[i].product!.price! * items[i].quantity!;
  //   }
  //
  //   var calculatedTax = total * value;
  //
  //   return calculatedTax;
  // }
  //
  // static finalCartValue(List<CartItemModel> items, double value) {
  //   double total = 0;
  //
  //   for (int i = 0; i < items.length; i++) {
  //     total += items[i].product!.price! * items[i].quantity!;
  //   }
  //
  //   return total;
  // }
  //
  // static double amountToBePay(List<CartItemModel> items) {
  //   var total = Calculations.finalCartValue(items, 100) +
  //       Calculations.taxValue(items, 0.18) -
  //       Calculations.discountValue(items, 0.10);
  //
  //   return total;
  // }
}
