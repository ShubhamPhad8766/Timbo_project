import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textwidget extends StatefulWidget {
  const Textwidget(
      {super.key,
      this.text,
      this.fontSize,
      this.letterSpacing,
      this.color,
      this.textAlign,
      this.fontWeight,
      this.textOverflow,
      this.textDecoration});
  final String? text;
  final double? fontSize;
  final double? letterSpacing;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;

  @override
  State<Textwidget> createState() => _TextwidgetState();
}

class _TextwidgetState extends State<Textwidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: widget.textAlign,
      widget.text ?? "",
      overflow: widget.textOverflow,
      style: GoogleFonts.khand(
          // style: GoogleFonts.kumbhSans(
          letterSpacing: widget.letterSpacing,
          decoration: widget.textDecoration,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.color ?? Theme.of(context).secondaryHeaderColor),
    );
  }
}
