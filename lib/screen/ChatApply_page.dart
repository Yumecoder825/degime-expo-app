import 'package:degime_131/screen/Chat_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/utils/Global_variable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyChatButton extends StatefulWidget {
  String? path = 'assets/images/chatapplication.svg';
  final Function()? changePath;
  MyChatButton({super.key, this.path, this.changePath});
  @override
  State<MyChatButton> createState() => _MyChatButtonState();
}

class _MyChatButtonState extends State<MyChatButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(widget.path!),
        onPressed: () {
          Widget okButton = Container(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            width: 140,
            height: 35,
            child: OutlinedButton(
                onPressed: widget.changePath,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: Colors.white,
                  side: const BorderSide(width: 1.0, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "はい",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                )),
          );
          Widget cancelButton = Container(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            width: 140,
            height: 35,
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  backgroundColor: const Color(0xFFFF8F61),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text(
                  "いいえ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )),
          );
          AlertDialog alert = AlertDialog(
            content: const Text(
              "本当にこの人にチャットを申し込みますか？",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [okButton, cancelButton],
              )
            ],
          );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return alert;
              });
        });
  }
}

class MyReturnButton extends StatelessWidget {
  final Function()? onReturn;

  const MyReturnButton({
    Key? key,
    this.onReturn,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Widget okButton = Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          width: 140,
          height: 35,
          child: OutlinedButton(
              onPressed: onReturn,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: Colors.white,
                side: const BorderSide(width: 1.0, color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "はい",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              )),
        );
        Widget cancelButton = Container(
          padding: const EdgeInsets.all(0),
          alignment: Alignment.center,
          width: 140,
          height: 35,
          child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                backgroundColor: const Color(0xFFFF8F61),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "いいえ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              )),
        );
        AlertDialog alert = AlertDialog(
          content: const Text(
            "この人を名刺管理に戻しますか？",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [okButton, cancelButton],
            )
          ],
        );
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            });
      },
      icon: SvgPicture.asset(
        'assets/images/returnlist.svg',
      ),
      iconSize: 60,
    );
  }
}

class MyListTile extends StatelessWidget {
  final String imagePath;
  final double svgRight;
  String title;
  String subtitle;
  final MyChatButton? myChatButton;
  final MyReturnButton? myReturnButton;
  final Function()? onTap;
  final bool isFirstPage;

  MyListTile({
    Key? key,
    this.myReturnButton,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.svgRight,
    this.myChatButton,
    required this.isFirstPage,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 50,
            alignment: Alignment.center,
            child: Stack(
              children: [
                imagePath.contains('assets')
                    ? Image.asset(
                        imagePath,
                        width: 50,
                      )
                    : Image.network(
                        imagePath,
                        width: 50,
                      ),
              ],
            ),
          ),
          title: Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8A8A8D))),
          trailing: Container(
              width: 100,
              //alignment: Alignment.centerRight,
              child: isFirstPage ? myChatButton : myReturnButton),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatPage(
                          index: 0,
                          folderName: '',
                          addFolder: [],
                        )));
          },
        ));
  }
}

class ChatApply extends StatefulWidget {
  const ChatApply({super.key});
  static String tag = "/ChatApply";
  @override
  State<ChatApply> createState() => _ChatApply();
}

class _ChatApply extends State<ChatApply> {
  TextEditingController _controller = TextEditingController();

  Future<void> changeSetting(String member, String settingname) async {
    var url = Uri.parse(
        'http://194.87.199.12:5000/social/private/contactdata?is_pending=${settingname}');
    var data = {"member": member};

    final requestbody = jsonEncode(data);
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${GlobalVariables.token}'
        },
        body: requestbody);
    await GlobalVariables.getMember();
    Navigator.of(context).pop();
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => ChatApply()));
  }

  @override
  void initState() {
    super.initState();
    GlobalVariables.getMember();
  }

  @override
  void dispose() {
    super.dispose();
    GlobalVariables.getMember();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
              color: Color.fromARGB(255, 240, 235, 235),
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: screenWidth,
                                      height: 200,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Positioned(
                                top: 25,
                                left: 10,
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/images/return.svg',
                                    color: const Color(0xFF9747FF),
                                  ),
                                  onPressed: () {
                                    const LandingPage().launch(context);
                                  },
                                )),
                            Positioned(
                              top: 30,
                              child: Container(
                                width: screenWidth,
                                alignment: Alignment.center,
                                child: const Text(
                                  'チャットを追加',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            Positioned(
                                top: 110,
                                left: screenWidth * 0.1,
                                child: (SizedBox(
                                    width: screenWidth * 0.8,
                                    height: 40,
                                    child: TextField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        suffixIcon: IconButton(
                                            icon: const Icon(
                                                Icons.search_rounded),
                                            onPressed: () {
                                              _controller.clear();
                                            }),
                                        suffixIconColor: Colors.white,
                                        hintStyle: const TextStyle(
                                            color: Colors.white),
                                        constraints: const BoxConstraints(),
                                        contentPadding: const EdgeInsets.all(0),
                                        fillColor: const Color(0xFF1F232F)
                                            .withOpacity(0.8),
                                        filled: true,
                                      ),
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.left,
                                      cursorColor: Colors.white,
                                    )))),
                          ],
                        ),
                      ],
                    ),
                    10.height,
                  ],
                ),
              )),
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        itemCount: GlobalVariables.memberlist.length,
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return (GlobalVariables.memberlist[index]
                                          ["is_pending"] ==
                                      "addChat" ||
                                  GlobalVariables.memberlist[index]
                                          ["is_pending"] ==
                                      "True") && GlobalVariables.memberlist[index]
                                          ["is_chat_available"] ==
                                      "False"
                              ? MyListTile(
                                  imagePath: GlobalVariables.memberlist[index]
                                              ["member_avatar"] !=
                                          null
                                      ? GlobalVariables.memberlist[index]
                                          ["member_avatar"]
                                      : 'assets/images/defaultavatar.png',
                                  title: GlobalVariables.memberlist[index]
                                      ["member"],
                                  subtitle: GlobalVariables.memberlist[index]
                                      ["member_email"],
                                  svgRight: 0,
                                  isFirstPage: true,
                                  myChatButton: MyChatButton(
                                    changePath: () {
                                      changeSetting(
                                          GlobalVariables.memberlist[index]
                                              ["member"],
                                          "True");
                                    },
                                    path: GlobalVariables.memberlist[index]
                                                ["is_pending"] ==
                                            "True"
                                        ? "assets/images/waitresponse.svg"
                                        : 'assets/images/chatapplication.svg',
                                  ),
                                )
                              : 0.height;
                        },
                      )
                    ]),
              ))
            ],
          ))
        ],
      ),
    );
  }
}
