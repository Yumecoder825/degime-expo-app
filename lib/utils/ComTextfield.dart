import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ComTextField extends StatelessWidget {
  final double textwidth;
  final double textheight;
  final Function(String) callback;
  Function()? completeCall;
  final String hinttext;
  final TextEditingController? controller;
  Widget? suffix;
  Widget? prefix;
  int? maxline;
  final double? wordsize;

  ComTextField(
      {super.key,
      required this.textheight,
      required this.textwidth,
      required this.callback,
      required this.hinttext,
      this.wordsize,
      this.completeCall,
      this.suffix,
      this.prefix,
      this.maxline,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: textwidth,
        height: textheight,
        padding: EdgeInsets.all(0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1.0, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              suffix: suffix,
              prefix: prefix,
              hintText: hinttext,
              hintStyle:
                  TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16),
              contentPadding: EdgeInsets.fromLTRB(20, 0, 3, 0)),
          style: TextStyle(fontSize: wordsize ?? 16),
          textAlign: TextAlign.left,
          onChanged: callback,
          maxLines: maxline,
          onEditingComplete: completeCall,
        ));
  }
}
