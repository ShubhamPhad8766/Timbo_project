// ignore_for_file: unnecessary_this

import 'package:intl/intl.dart';

extension RupeesFormatter on int {
  String inRupeesFormat() {
    return indianRupeesFormat.format(this);
  }
}

final indianRupeesFormat = NumberFormat.currency(
  name: "INR",
  locale: 'en_IN',
  decimalDigits: 2,
  symbol: '₹',
);

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String getInitials() {
    List<String> parts = this.split(" ");
    if (parts.length >= 2) {
      String firstNameInitial = parts[0][0];
      String lastNameInitial = parts[1][0];
      return firstNameInitial.toUpperCase() + lastNameInitial.toUpperCase();
    } else {
      return this.substring(0, 2).toUpperCase();
    }
    // return "${this.substring(0, 1)} ${this.substring(this.length - 1)}";
    //  name.substring(0, 1) + name.substring(name.length - 1);
  }
}
