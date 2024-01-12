import 'package:degime_131/screen/Chat_page.dart';
import 'package:degime_131/screen/Landing_next.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:degime_131/screen/Login_page.dart';
import 'package:degime_131/screen/Theme_select.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/screen/Menu_page.dart';

class ChattingField extends StatefulWidget {
  List<Widget> addFolder;
  String? imagePath;
  String? title;
  String? subtitle;
  ChattingField(
      {super.key,
      this.imagePath,
      required this.addFolder,
      this.title,
      this.subtitle});
  static String tag = "/ChattingField";
  @override
  State<ChattingField> createState() => _ChattingField();
}

class _ChattingField extends State<ChattingField> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth:
              widget.addFolder.isEmpty ? 80 : MediaQuery.of(context).size.width,
          leading: Row(
            children: [
              20.width,
              widget.addFolder.isEmpty
                  ? Image.asset(
                      widget.imagePath!,
                      width: 50,
                      height: 50,
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.addFolder.length,
                              itemBuilder: (BuildContext context, int index) {
                                return widget.addFolder[index];
                              },
                            ),
                          )
                        ],
                      ),
                    )
            ],
          ),
          titleTextStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          title: widget.addFolder.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      widget.title!,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      widget.subtitle!,
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                )
              : null),
      body: Container(),
      bottomSheet: Row(
        children: [
          50.width,
          SizedBox(
              width: screenWidth * 0.6,
              height: 40,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: '書く',
                  suffixIcon:
                      IconButton(icon: Icon(Icons.message), onPressed: () {}),
                  hintStyle: const TextStyle(color: Colors.black),
                  constraints: const BoxConstraints(),
                  contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  fillColor: Colors.black.withOpacity(0.25),
                  filled: true,
                ),
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
                cursorColor: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/camera.svg'),
            iconSize: 40,
          )
        ],
      ),
    );
  }
}
