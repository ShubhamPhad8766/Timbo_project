import 'package:flutter/material.dart';
import '../../../widgets/text_widget.dart';

class SnackBarWidget {
  static void showSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // showCloseIcon: true,
        // closeIconColor: Theme.of(context).secondaryHeaderColor,
        backgroundColor: Theme.of(context).primaryColor,
        content: Textwidget(
          text: errorMessage,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).secondaryHeaderColor,
        )));
  }
}
