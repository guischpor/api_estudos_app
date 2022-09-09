import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatelessWidget {
  final String? labelText;
  final String? label;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final String? hintText;
  final Widget? preffix;
  final Widget? suffix;
  final bool? enabled;
  final bool isActiveTitle;
  final String? title;
  final void Function(String)? onChanged;

  const CustomTextForm({
    Key? key,
    this.label,
    this.labelText,
    this.textInputAction,
    required this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.onSaved,
    this.validator,
    this.initialValue,
    this.obscureText = false,
    this.hintText,
    this.preffix,
    this.suffix,
    this.enabled,
    this.isActiveTitle = false,
    this.title,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isActiveTitle) ...[
          Text(
            title!,
            style: GoogleFonts.lato(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
        ],
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            // color: Colors.white,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hintText,
              hintStyle: GoogleFonts.lato(
                fontSize: 15,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigoAccent,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigoAccent,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.indigoAccent,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              prefixIcon: preffix,
              suffixIcon: suffix,
              contentPadding: const EdgeInsets.all(17),
            ),
            initialValue: initialValue,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            controller: controller,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            maxLines: maxLines,
            onSaved: onSaved,
            validator: validator,
            obscureText: obscureText,
            enabled: enabled,
            onChanged: onChanged,
            style: GoogleFonts.lato(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
