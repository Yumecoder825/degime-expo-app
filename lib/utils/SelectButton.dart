import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui';

class SelectButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  double? width;
  Color? backgroundColor;

  SelectButton(
      {super.key,
      this.onPressed,
      required this.title,
      this.width,
      this.backgroundColor});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        width: width!,
        height: 30,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(0),
            side: BorderSide.none,
            backgroundColor: backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
