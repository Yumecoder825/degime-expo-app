import 'dart:convert';
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
import 'package:degime_131/utils/Global_variable.dart';

class Item {
  final String path;
  final String title;
  final String name;

  Item(this.path, this.title, this.name);
}

class ChattingField extends StatefulWidget {
  var member;
  ChattingField({super.key, this.member});
  static String tag = "/ChattingField";
  @override
  State<ChattingField> createState() => _ChattingField();
}

class _ChattingField extends State<ChattingField> {
  List<Item> items = [];
  var avatarGroup = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.member["member"].length; i++) {
      if (widget.member["member"][i]['username'] != GlobalVariables.username)
        items.add(Item(
            widget.member["member"][i]['avatar'].toString(),
            widget.member["chat_group"],
            widget.member["member"][i]['username']));
      avatarGroup.add({
        widget.member["member"][i]['username']:
            widget.member["member"][i]['avatar'].toString()
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth:
              items.length == 1 ? 80 : MediaQuery.of(context).size.width,
          leading: Row(
            children: [
              20.width,
              items.length == 1
                  ? items[0].path.contains("http")
                      ? Image.network(
                          items[0].path,
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "assets/images/defaultavatar.png",
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
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return items[index].path.contains("http")
                                    ? Image.network(
                                        items[index].path,
                                        width: 50,
                                        height: 50,
                                      )
                                    : Image.asset(
                                        "assets/images/defaultavatar.png",
                                        width: 50,
                                        height: 50,
                                      );
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
          title: items.length == 1
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      items[0].title,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              : null),
      body: SingleChildScrollView(
          child: Column(
        children: [
          ListView.builder(
            itemCount: GlobalVariables.messages.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                leading: (jsonDecode(
                            GlobalVariables.messages[index]))["sender"] !=
                        GlobalVariables.username
                    ? Container(
                        margin: EdgeInsets.only(bottom: 10),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.6),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child:
                            // Row(
                            //   children: [
                            //     avatarGroup.firstWhere(
                            //                 (element) => element.containsKey(
                            //                     (jsonDecode(GlobalVariables
                            //                         .messages[index]))["sender"]),
                            //                 orElse: () => null)["sender"] !=
                            //             null
                            //         ? Image.network(
                            //             avatarGroup.firstWhere(
                            //                 (element) => element.containsKey(
                            //                     (jsonDecode(GlobalVariables
                            //                         .messages[index]))["sender"]),
                            //                 orElse: () => null)["sender"],
                            //             width: 30,
                            //           )
                            //         : Image.asset(
                            //             "assets/images/defaultavatar.png",
                            //             width: 30,
                            //           ),
                            Text(
                          (jsonDecode(GlobalVariables.messages[index]))["text"],
                          style: TextStyle(fontSize: 16),
                        ),
                        //   ],
                        // )
                      )
                    : null,
                trailing:
                    (jsonDecode(GlobalVariables.messages[index]))["sender"] ==
                                GlobalVariables.username &&
                            (jsonDecode(GlobalVariables.messages[index]))[
                                    "is_Connected"] !=
                                "True"
                        ? Container(
                            margin: EdgeInsets.only(bottom: 10),
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Text(
                                (jsonDecode(
                                    GlobalVariables.messages[index]))["text"],
                                style: TextStyle(fontSize: 16)),
                          )
                        : null,
              );
            },
          ),
          100.height
        ],
      )),
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
                  suffixIcon: IconButton(
                      icon: Icon(Icons.message),
                      onPressed: () {
                        GlobalVariables.channel == null
                            ? null
                            : GlobalVariables.channel.sink.add(jsonEncode({
                                "text": _controller.text,
                                "sender": GlobalVariables.username
                              }));
                        //GlobalVariables.messages.add(_controller.text);
                        // Navigator.of(context).pop();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             ChattingField( member: GlobalVariables.chatroom[GlobalVariables.index])));
                      }),
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
