import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar({
  required final String title,
  final bool? centerTitle = false,
  final Color? backgroundColor = Colors.indigo,
  final List<Widget>? actions,
  final double? elevation = 0,
}) {
  return AppBar(
    title: Text(
      title,
      style: GoogleFonts.ubuntu(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    actions: actions,
    elevation: elevation,
  );
}
