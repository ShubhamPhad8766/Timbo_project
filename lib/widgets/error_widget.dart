import 'package:flutter/material.dart';
import 'package:timbo/widgets/text_widget.dart';

class CustomErrorWidget extends StatefulWidget {
  const CustomErrorWidget({super.key, required this.errorText});
  final String? errorText;

  @override
  State<CustomErrorWidget> createState() => _ErrorWidgetState();
}

class _ErrorWidgetState extends State<CustomErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Textwidget(
      text: widget.errorText,
      color: Colors.red,
    );
  }
}
