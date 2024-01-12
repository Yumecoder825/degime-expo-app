import 'package:flutter/material.dart';
import 'dart:ui';

class Okbutton extends StatelessWidget {
  String? string;
  final Function()? onPressed;

  Okbutton({super.key, this.onPressed, this.string});
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
              onPressed: onPressed,
              //Navigator.pop(context);,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
                side: const BorderSide(width: 1.0, color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                string ?? "はい",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              )),
        ));
  }
}
