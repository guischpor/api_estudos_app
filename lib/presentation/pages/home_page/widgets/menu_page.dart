// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  MenuPage({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
    this.color,
    this.splashColor,
  }) : super(key: key);

  final IconData iconData;
  final String title;
  final void Function() onTap;
  Color? color = Colors.indigoAccent[100];
  Color? splashColor = Colors.indigoAccent;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      color: color,
      child: InkWell(
        splashColor: splashColor,
        borderRadius: BorderRadius.circular(10),
        splashFactory: InkSplash.splashFactory,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 33,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
