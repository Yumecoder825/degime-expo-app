import 'package:flutter/material.dart';
import 'dart:ui';

class Cancelbutton extends StatelessWidget {
  String? string;
  final Function()? onPressed;
  Color? color;

  Cancelbutton({super.key, this.color, this.string, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(0),
        alignment: Alignment.center,
        width: 120,
        height: 35,
        child: Container(
          width: 120,
          height: 35,
          child: OutlinedButton(
              onPressed: onPressed ??
                  () {
                    Navigator.pop(context);
                  },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: color ?? Color(0xFFFF8F61),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                string ?? "いいえ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              )),
        ));
  }
}
