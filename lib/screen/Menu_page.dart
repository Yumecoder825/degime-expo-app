import 'package:degime_131/utils/Global_variable.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';

class MyPopupMenuButton1 extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onBlock;
  final Function()? onNone;
  final String? svgPath;

  MyPopupMenuButton1({
    Key? key,
    this.svgPath,
    this.onDelete,
    this.onBlock,
    this.onNone,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: SvgPicture.asset(svgPath.toString()),
      iconSize: 60,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 11',
          onTap: onNone,
          child: const Text('元に戻す'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 21',
          onTap: onBlock,
          child: const Text('ブロックする'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 31',
          child: const Text('削除する'),
          onTap: onDelete,
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 31') {
          Widget okButton = Container(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            width: 140,
            height: 35,
            child: OutlinedButton(
                onPressed: () {
                  onDelete;
                },
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
              "本当にこの人を削除しますか？",
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
        }
        if (value == "Option 21") {
          onBlock;
        }
        if (value == "Option 11") {
          onNone;
        }
      },
    );
  }
}

class MyPopupMenuButton2 extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onUnannounce;
  final Function()? onNone;
  final String? svgPath;

  MyPopupMenuButton2({
    Key? key,
    this.onNone,
    this.onUnannounce,
    this.svgPath,
    this.onDelete,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: SvgPicture.asset(svgPath.toString()),
      iconSize: 60,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 13',
          onTap: onNone,
          child: const Text('元に戻す'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 23',
          onTap: onUnannounce,
          child: const Text('非通知にする'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 33',
          child: const Text('削除する'),
          onTap: onDelete,
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 33') {
          Widget okButton = Container(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            width: 140,
            height: 35,
            child: OutlinedButton(
                onPressed: () {
                  onDelete;
                },
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
              "本当にこの人を削除しますか？",
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
        }
        if (value == "Option 23") {
          onUnannounce;
        }
        if (value == "Option 13") {
          onNone;
        }
      },
    );
  }
}

class MyPopupMenuButton3 extends StatelessWidget {
  final Function()? onUnannounce;
  final Function()? onNone;
  final Function()? onBlock;
  final String? svgPath;

  MyPopupMenuButton3({
    Key? key,
    this.svgPath,
    this.onBlock,
    this.onUnannounce,
    this.onNone,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: SvgPicture.asset(svgPath.toString()),
      iconSize: 60,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 12',
          onTap: onNone,
          child: const Text('元に戻す'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 22',
          onTap: onUnannounce,
          child: const Text('非通知にする'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 32',
          child: const Text('ブロックする'),
          onTap: onBlock,
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 12') {
          onNone;
        }
        if (value == 'Option 22') {
          onUnannounce;
        }
        if (value == 'Option 32') {
          onBlock;
        }
      },
    );
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
  final MyPopupMenuButton1? myPopupMenuButton1;
  final MyPopupMenuButton2? myPopupMenuButton2;
  final MyPopupMenuButton3? myPopupMenuButton3;
  final MyReturnButton? myReturnButton;
  final Function()? onTap;
  //final Function()? onBlock;
  final bool isFirstPage;
  final bool isSecondPage;

  MyListTile({
    Key? key,
    this.myReturnButton,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.svgRight,
    this.myPopupMenuButton1,
    this.myPopupMenuButton2,
    this.myPopupMenuButton3,
    required this.isFirstPage,
    required this.isSecondPage,
    this.onTap,
    //this.onBlock,
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
                Positioned(
                  top: 0,
                  right: svgRight,
                  child: SvgPicture.asset('assets/images/new.svg'),
                )
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
              width: 80,
              alignment: Alignment.centerRight,
              child: isFirstPage
                  ? myPopupMenuButton1
                  : isSecondPage
                      ? myPopupMenuButton2
                      : myPopupMenuButton3),
          onTap: () {},
        ));
  }
}

class MenuPage1 extends StatefulWidget {
  bool isVisible1;
  bool isVisible2;
  bool isVisible3;
  MenuPage1(
      {super.key,
      required this.isVisible1,
      required this.isVisible2,
      required this.isVisible3});
  static String tag = "/Menupage1";
  @override
  State<MenuPage1> createState() => _MenuPage1();
}

class _MenuPage1 extends State<MenuPage1> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    GlobalVariables.getMember();
  }

  Future<void> changeSetting(String member, String settingname) async {
    var url = Uri.parse('http://194.87.199.12:5000/social/private/contactdata');
    var data = {"member": member, "block_setting": settingname};
    final requestbody = jsonEncode(data);
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${GlobalVariables.token}'
        },
        body: requestbody);
    await GlobalVariables.getMember();
    Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => MenuPage1(
                isVisible1: true, isVisible2: false, isVisible3: false)));
  }

  @override
  Widget menu1(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
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
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("qerqwr");
                                    },
                                    child: const Stack(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/bell.png'),
                                          width: 22,
                                        ),
                                        Positioned(
                                            top: 9,
                                            left: 10,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/circle.png'),
                                              width: 13,
                                              height: 13,
                                              fit: BoxFit.fill,
                                            )),
                                      ],
                                    ),
                                  ),
                                  10.width,
                                  PopupMenuButton<String>(
                                    icon: const Icon(Icons.menu),
                                    iconSize: 25,
                                    onSelected: (value) {
                                      setState(() {
                                        if (value == 'Option 1') {
                                          MenuPage1(
                                                  isVisible1: true,
                                                  isVisible2: false,
                                                  isVisible3: false)
                                              .launch(context);
                                        } else if (value == 'Option 2') {
                                          MenuPage1(
                                                  isVisible1: false,
                                                  isVisible2: true,
                                                  isVisible3: false)
                                              .launch(context);
                                        } else if (value == 'Option 3') {
                                          MenuPage1(
                                                  isVisible1: false,
                                                  isVisible2: false,
                                                  isVisible3: true)
                                              .launch(context);
                                        }
                                      });
                                      // Perform action based on the selected value
                                      print('Selected: $value');
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        const [
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 1',
                                        child: Text('非通知一覧'),
                                      ),
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 2',
                                        child: Text('ブロック一覧'),
                                      ),
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 3',
                                        child: Text('削除一覧'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                          icon: SvgPicture.asset('assets/images/return.svg'),
                          onPressed: () {
                            const LandingPage().launch(context);
                          },
                        )),
                    Positioned(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: (SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: '検索',
                                suffixIcon: IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () {
                                      _controller.clear();
                                    }),
                                suffixIconColor: Colors.white,
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.search_outlined),
                                prefixIconColor: Colors.white,
                                constraints: const BoxConstraints(),
                                contentPadding: const EdgeInsets.all(0),
                                fillColor: const Color(0xFFDADADA),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text(
                      '非通知一覧',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF565E70),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
        ListView.builder(
          itemCount: GlobalVariables.memberlist.length,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GlobalVariables.memberlist[index]["block_setting"] ==
                    "Unannounce"
                ? MyListTile(
                    imagePath: GlobalVariables.memberlist[index]
                                ["member_avatar"] !=
                            null
                        ? GlobalVariables.memberlist[index]["member_avatar"]
                        : 'assets/images/defaultavatar.png',
                    title: GlobalVariables.memberlist[index]["member"],
                    subtitle: GlobalVariables.memberlist[index]["member_email"],
                    svgRight: 0,
                    isFirstPage: true,
                    isSecondPage: false,
                    myPopupMenuButton1: MyPopupMenuButton1(
                      svgPath: 'assets/images/setting.svg',
                      onBlock: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "Block");
                      },
                      onDelete: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "Deleted");
                      },
                      onNone: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "None");
                      },
                    ),
                  )
                : 0.height;
          },
        )
      ]),
    );
  }

  Widget menu2(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
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
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("qerqwr");
                                    },
                                    child: const Stack(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/bell.png'),
                                          width: 22,
                                        ),
                                        Positioned(
                                            top: 9,
                                            left: 10,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/circle.png'),
                                              width: 13,
                                              height: 13,
                                              fit: BoxFit.fill,
                                            )),
                                      ],
                                    ),
                                  ),
                                  10.width,
                                  PopupMenuButton<String>(
                                    icon: const Icon(Icons.menu),
                                    iconSize: 25,
                                    onSelected: (value) {
                                      setState(() {
                                        if (value == 'Option 1') {
                                          MenuPage1(
                                                  isVisible1: true,
                                                  isVisible2: false,
                                                  isVisible3: false)
                                              .launch(context);
                                        } else if (value == 'Option 2') {
                                          MenuPage1(
                                                  isVisible1: false,
                                                  isVisible2: true,
                                                  isVisible3: false)
                                              .launch(context);
                                        } else if (value == 'Option 3') {
                                          MenuPage1(
                                                  isVisible1: false,
                                                  isVisible2: false,
                                                  isVisible3: true)
                                              .launch(context);
                                        }
                                      });
                                      // Perform action based on the selected value
                                      print('Selected: $value');
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        const [
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 1',
                                        child: Text('非通知一覧'),
                                      ),
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 2',
                                        child: Text('ブロック一覧'),
                                      ),
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 3',
                                        child: Text('削除一覧'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                          icon: SvgPicture.asset('assets/images/return.svg'),
                          onPressed: () {
                            const LandingPage().launch(context);
                          },
                        )),
                    Positioned(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: (SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: '検索',
                                suffixIcon: IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () {
                                      _controller.clear();
                                    }),
                                suffixIconColor: Colors.white,
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.search_outlined),
                                prefixIconColor: Colors.white,
                                constraints: const BoxConstraints(),
                                contentPadding: const EdgeInsets.all(0),
                                fillColor: const Color(0xFFDADADA),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text(
                      'ブロック一覧',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF565E70),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
        ListView.builder(
          itemCount: GlobalVariables.memberlist.length,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GlobalVariables.memberlist[index]["block_setting"] == "Block"
                ? MyListTile(
                    imagePath: GlobalVariables.memberlist[index]
                                ["member_avatar"] !=
                            null
                        ? GlobalVariables.memberlist[index]["member_avatar"]
                        : 'assets/images/defaultavatar.png',
                    title: GlobalVariables.memberlist[index]["member"],
                    subtitle: GlobalVariables.memberlist[index]["member_email"],
                    svgRight: 0,
                    isFirstPage: false,
                    isSecondPage: true,
                    myPopupMenuButton2: MyPopupMenuButton2(
                      svgPath: 'assets/images/setting.svg',
                      onUnannounce: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "Unannounce");
                      },
                      onDelete: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "Deleted");
                      },
                      onNone: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "None");
                      },
                    ),
                  )
                : 0.height;
          },
        )
      ]),
    );
  }

  Widget menu3(BuildContext context) {
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(
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
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                            )
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print("qerqwr");
                                    },
                                    child: const Stack(
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'assets/images/bell.png'),
                                          width: 22,
                                        ),
                                        Positioned(
                                            top: 9,
                                            left: 10,
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/circle.png'),
                                              width: 13,
                                              height: 13,
                                              fit: BoxFit.fill,
                                            )),
                                      ],
                                    ),
                                  ),
                                  10.width,
                                  PopupMenuButton<String>(
                                    icon: const Icon(Icons.menu),
                                    iconSize: 25,
                                    onSelected: (value) {
                                      setState(() {
                                        if (value == 'Option 1') {
                                          MenuPage1(
                                                  isVisible1: true,
                                                  isVisible2: false,
                                                  isVisible3: false)
                                              .launch(context);
                                        } else if (value == 'Option 2') {
                                          MenuPage1(
                                                  isVisible1: false,
                                                  isVisible2: true,
                                                  isVisible3: false)
                                              .launch(context);
                                        } else if (value == 'Option 3') {
                                          MenuPage1(
                                                  isVisible1: false,
                                                  isVisible2: false,
                                                  isVisible3: true)
                                              .launch(context);
                                        }
                                      });
                                      // Perform action based on the selected value
                                      print('Selected: $value');
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        const [
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 1',
                                        child: Text('非通知一覧'),
                                      ),
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 2',
                                        child: Text('ブロック一覧'),
                                      ),
                                      PopupMenuItem<String>(
                                        padding: EdgeInsets.only(left: 10),
                                        value: 'Option 3',
                                        child: Text('削除一覧'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Positioned(
                        top: 10,
                        left: 10,
                        child: IconButton(
                          icon: SvgPicture.asset('assets/images/return.svg'),
                          onPressed: () {
                            const LandingPage().launch(context);
                          },
                        )),
                    Positioned(
                        top: 60,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: (SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 40,
                            child: TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                hintText: '検索',
                                suffixIcon: IconButton(
                                    icon: const Icon(Icons.cancel),
                                    onPressed: () {
                                      _controller.clear();
                                    }),
                                suffixIconColor: Colors.white,
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(Icons.search_outlined),
                                prefixIconColor: Colors.white,
                                constraints: const BoxConstraints(),
                                contentPadding: const EdgeInsets.all(0),
                                fillColor: const Color(0xFFDADADA),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(left: 30),
                    child: const Text(
                      '削除一覧',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF565E70),
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
        ListView.builder(
          itemCount: GlobalVariables.memberlist.length,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GlobalVariables.memberlist[index]["block_setting"] ==
                    "Deleted"
                ? MyListTile(
                    imagePath: GlobalVariables.memberlist[index]
                                ["member_avatar"] !=
                            null
                        ? GlobalVariables.memberlist[index]["member_avatar"]
                        : 'assets/images/defaultavatar.png',
                    title: GlobalVariables.memberlist[index]["member"],
                    subtitle: GlobalVariables.memberlist[index]["member_email"],
                    svgRight: 0,
                    isFirstPage: false,
                    isSecondPage: false,
                    myPopupMenuButton3: MyPopupMenuButton3(
                      svgPath: 'assets/images/setting.svg',
                      onBlock: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "Block");
                      },
                      onUnannounce: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "Unannounce");
                      },
                      onNone: () {
                        changeSetting(
                            GlobalVariables.memberlist[index]["member"],
                            "None");
                      },
                    ),
                  )
                : 0.height;
          },
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: widget.isVisible1 == true
                ? menu1(context)
                : widget.isVisible2 == true
                    ? menu2(context)
                    : menu3(context)));
  }
}
