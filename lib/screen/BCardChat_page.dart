import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';

// import 'package:degime_131/screen/Menu_page2.dart';
// import 'package:degime_131/screen/Menu_page3.dart';

class MyChatButton extends StatelessWidget {
  final Function()? onDelete;
  final String? svgPath;

  const MyChatButton({
    Key? key,
    this.svgPath,
    this.onDelete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: SvgPicture.asset(svgPath.toString()),
        onPressed: () {
          Widget okButton = Container(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            width: 140,
            height: 35,
            child: OutlinedButton(
                onPressed: onDelete,
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
              "この人にチャットを申し込みますか？",
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
                Positioned(
                  top: 0,
                  right: svgRight,
                  child: SvgPicture.asset('assets/images/new.svg'),
                )
              ],
            ),
          ),
          title: const Text(
            'Jane Cooper   CEO   ○○○○株式会社',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('2022/11/20保存 2022/11/20更新',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8A8A8D))),
          trailing: Container(
              width: 80, child: isFirstPage ? myChatButton : myReturnButton),
          onTap: () {},
        ));
  }
}

class BCardChat extends StatefulWidget {
  const BCardChat({super.key});
  static String tag = "/BCardChat";
  @override
  State<BCardChat> createState() => _BCardChat();
}

class _BCardChat extends State<BCardChat> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
        ),
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                        backgroundColor: Colors.white,
                        leadingWidth: screenWidth,
                        expandedHeight: 310,
                        floating: true,
                        pinned: false,
                        automaticallyImplyLeading: true,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Container(
                                child: Row(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'assets/images/second_slash.png'),
                                                  width: screenWidth,
                                                  height: 180,
                                                  fit: BoxFit.cover,
                                                ),
                                              ],
                                            ),
                                            40.height
                                          ],
                                        ),
                                        Positioned(
                                            top: 10,
                                            left: 10,
                                            child: IconButton(
                                              icon: SvgPicture.asset(
                                                  'assets/images/return.svg'),
                                              onPressed: () {
                                                const LandingPage()
                                                    .launch(context);
                                              },
                                            )),
                                        Positioned(
                                          top: 130,
                                          left: screenWidth / 2 - 39,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/avatar.png'),
                                            fit: BoxFit.cover,
                                            width: 80,
                                          ),
                                        ),
                                        Positioned(
                                          top: 30,
                                          child: Container(
                                            width: screenWidth,
                                            alignment: Alignment.center,
                                            child: const Text(
                                              'パブリック',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(children: [
                                      const Text(
                                        "はるこ",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      10.height,
                                    ])
                                  ],
                                ),
                                const TabBar(
                                  indicatorColor: Color(0xFF9747FF),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  unselectedLabelColor: Colors.black,
                                  labelColor: Color(0xFF9747FF),
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  tabs: [
                                    Tab(text: 'ビジネス'),
                                    Tab(text: 'プライベート'),
                                  ],
                                )
                              ]).expand()
                        ])))),
                  ];
                },
                body: const TabBarView(
                  children: [FirstScreen(), SecondScreen()],
                ))));
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  late List<MyListTile> listtiles = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myChatButton: MyChatButton(
        svgPath: 'assets/images/chat.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(0);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: true,
      myChatButton: MyChatButton(
        svgPath: 'assets/images/chat.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(1);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: true,
      myChatButton: MyChatButton(
        svgPath: 'assets/images/chat.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(2);
            //listtiles.add(listtiles[0]);
          });
          Navigator.pop(context);
        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: ListView.builder(
      itemCount: listtiles.length,
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return listtiles[index];
      },
    )));
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  late List<MyListTile> listtiles = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myChatButton: MyChatButton(
        svgPath: 'assets/images/chat.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(0);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: true,
      myChatButton: MyChatButton(
        svgPath: 'assets/images/chat.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(1);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: true,
      myChatButton: MyChatButton(
        svgPath: 'assets/images/chat.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(2);
            //listtiles.add(listtiles[0]);
          });
          Navigator.pop(context);
        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: listtiles.length,
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return listtiles[index];
      },
    ));
  }
}
