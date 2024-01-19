// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.baiJamjuree(
          color: color, fontSize: size, fontWeight: fontWeight),
      textAlign: textAlign,
    );
  }
}
