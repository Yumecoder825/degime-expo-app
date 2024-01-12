import 'package:degime_131/screen/Chat_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';
// import 'package:degime_131/screen/Menu_page2.dart';
// import 'package:degime_131/screen/Menu_page3.dart';

class MyChatButton extends StatefulWidget {
  const MyChatButton({super.key});
  @override
  State<MyChatButton> createState() => _MyChatButtonState();
}

class _MyChatButtonState extends State<MyChatButton> {
  String path = 'assets/images/chatapplication.svg';
  void changePath() {
    setState(() {
      path = "assets/images/waitresponse.svg";
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(path),
        onPressed: () {
          Widget okButton = Container(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            width: 140,
            height: 35,
            child: OutlinedButton(
                onPressed: changePath,
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
  final MyChatButton? myChatButton;
  final MyReturnButton? myReturnButton;
  final Function()? onTap;
  final bool isFirstPage;

  const MyListTile({
    Key? key,
    this.myReturnButton,
    required this.imagePath,
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
                Image.asset(
                  imagePath,
                  width: 40,
                ),
              ],
            ),
          ),
          title: const Text(
            'Jane Cooper',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('(270)555-0117, 2019/11/20',
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
                context, MaterialPageRoute(builder: (context) => ChatPage(index: 0,folderName: '',addFolder: [],)));
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
  late List<MyListTile> listtiles = const [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myChatButton: MyChatButton(),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: true,
      myChatButton: MyChatButton(),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: true,
      myChatButton: MyChatButton(),
    ),
  ];
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
                        itemCount: listtiles.length,
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return listtiles[index];
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
