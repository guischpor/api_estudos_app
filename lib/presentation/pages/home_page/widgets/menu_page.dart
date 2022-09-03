import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,

  }) : super(key: key);

  final IconData iconData;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 8,
      color: Colors.indigoAccent[100],
      child: InkWell(
        splashColor: Colors.indigoAccent,
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
