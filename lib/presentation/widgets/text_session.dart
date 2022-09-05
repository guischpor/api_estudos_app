import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSession extends StatelessWidget {
  const TextSession({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          content,
          style: GoogleFonts.lato(
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
