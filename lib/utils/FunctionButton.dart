import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class FunctionButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  Color? bordercolor;
  Color? fillcolor;
  Color? wordcolor;
  double? width;
  double? height;
  double? wordsize;

  FunctionButton(
      {super.key,
      this.onPressed,
      this.width,
      this.height,
      this.wordsize,
      this.bordercolor,
      required this.title,
      this.fillcolor,
      this.wordcolor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        height: height ?? 40,
        child: Stack(
          children: [
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                backgroundColor: fillcolor ?? Colors.white,
                side: BorderSide(
                  width: 1.0,
                  color: bordercolor ?? Colors.black,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: wordsize ?? 16,
                        color: wordcolor ?? Colors.black.withOpacity(0.3),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
