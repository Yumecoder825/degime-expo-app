import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';

class MyPopupMenuButton1 extends StatelessWidget {
  final Function()? onDelete;
  final Function()? onBlock;
  final String? svgPath;

  const MyPopupMenuButton1({
    Key? key,
    this.svgPath,
    this.onDelete,
    this.onBlock,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: SvgPicture.asset(svgPath.toString()),
      iconSize: 60,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 1',
          onTap: () {},
          child: const Text('元に戻す'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 2',
          onTap: onBlock,
          child: const Text('ブロックする'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 3',
          child: const Text('削除する'),
          onTap: () {},
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 3') {
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
      },
    );
  }
}

class MyPopupMenuButton2 extends StatelessWidget {
  final Function()? onDelete;
  final String? svgPath;

  const MyPopupMenuButton2({
    Key? key,
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
          value: 'Option 1',
          onTap: () {},
          child: const Text('元に戻す'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 2',
          onTap: () {},
          child: const Text('非通知にする'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 3',
          child: const Text('削除する'),
          onTap: () {},
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 3') {
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
      },
    );
  }
}

class MyPopupMenuButton3 extends StatelessWidget {
  final Function()? onDelete;
  final String? svgPath;

  const MyPopupMenuButton3({
    Key? key,
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
          value: 'Option 1',
          onTap: () {},
          child: const Text('元に戻す'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 2',
          onTap: () {},
          child: const Text('非通知にする'),
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.only(left: 10),
          value: 'Option 3',
          child: const Text('ブロックする'),
          onTap: () {},
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 2') {}
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
  final MyPopupMenuButton1? myPopupMenuButton1;
  final MyPopupMenuButton2? myPopupMenuButton2;
  final MyPopupMenuButton3? myPopupMenuButton3;
  final MyReturnButton? myReturnButton;
  final Function()? onTap;
  //final Function()? onBlock;
  final bool isFirstPage;
  final bool isSecondPage;

  const MyListTile({
    Key? key,
    this.myReturnButton,
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

  late List<MyListTile> listtiles1 = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      isSecondPage: false,
      myPopupMenuButton1: MyPopupMenuButton1(
        svgPath: 'assets/images/setting.svg',
        onBlock: () {
          setState(() {
            listtiles1
              ..removeWhere(
                  (widget) => widget.imagePath == 'assets/images/avatar1.png');
            listtiles1.add(
              MyListTile(
                imagePath: 'assets/images/avatar1.png',
                svgRight: 100,
                isFirstPage: false,
                isSecondPage: true,
                myPopupMenuButton2: MyPopupMenuButton2(
                  svgPath: 'assets/images/setting.svg',
                  onDelete: () {
                    setState(() {
                      listtiles2.removeAt(listtiles2.length);
                    });
                  },
                ),
              ),
            );
          });
        },
        onDelete: () {
          setState(() {
            listtiles1
              ..removeWhere(
                  (widget) => widget.imagePath == 'assets/images/avatar1.png');
          });
          Navigator.of(context).pop();
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: true,
      isSecondPage: false,
      myPopupMenuButton1: MyPopupMenuButton1(
        svgPath: 'assets/images/setting.svg',
        onBlock: () {
          setState(() {
            listtiles1
              ..removeWhere(
                  (widget) => widget.imagePath == 'assets/images/avatar2.png');
            listtiles2.add(
              MyListTile(
                imagePath: 'assets/images/avatar2.png',
                svgRight: 100,
                isFirstPage: false,
                isSecondPage: true,
                myPopupMenuButton2: MyPopupMenuButton2(
                  svgPath: 'assets/images/setting.svg',
                  onDelete: () {
                    setState(() {
                      listtiles2.removeAt(listtiles2.length);
                    });
                  },
                ),
              ),
            );
          });
        },
        onDelete: () {
          setState(() {
            listtiles1
              ..removeWhere(
                  (widget) => widget.imagePath == 'assets/images/avatar2.png');
          });
          Navigator.of(context).pop();
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 0,
      isFirstPage: true,
      isSecondPage: false,
      myPopupMenuButton1: MyPopupMenuButton1(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles1
              ..removeWhere(
                  (widget) => widget.imagePath == 'assets/images/avatar3.png');
          });
          Navigator.of(context).pop();
        },
      ),
    ),
  ];

  late List<MyListTile> listtiles2 = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: true,
      myPopupMenuButton2: MyPopupMenuButton2(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles2.removeAt(0);
          });
          //Navigator.pop(context);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //       builder: (context) =>
          //           MenuPage3(path: 'assets/images/avatar1.png')),
          // );
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: false,
      isSecondPage: true,
      myPopupMenuButton2: MyPopupMenuButton2(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles2.removeAt(1);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: true,
      myPopupMenuButton2: MyPopupMenuButton2(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles2.removeAt(2);
            //listtil2es.add(listtiles[0]);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: true,
      myPopupMenuButton2: MyPopupMenuButton2(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles2.removeAt(3);
          });
          Navigator.pop(context);
        },
      ),
    ),
  ];

  late List<MyListTile> listtiles3 = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: false,
      myPopupMenuButton3: MyPopupMenuButton3(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles3.removeAt(0);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: false,
      myPopupMenuButton3: MyPopupMenuButton3(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles3.removeAt(1);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: false,
      myPopupMenuButton3: MyPopupMenuButton3(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles3.removeAt(2);
          });
          Navigator.pop(context);
        },
      ),
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: false,
      isSecondPage: false,
      myPopupMenuButton3: MyPopupMenuButton3(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles3.removeAt(3);
            //listtiles.add(listtiles[0]);
          });
          //Navigator.pop(context);
        },
      ),
    ),
  ];

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
          itemCount: listtiles1.length,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return listtiles1[index];
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
          itemCount: listtiles2.length,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return listtiles2[index];
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
          itemCount: listtiles3.length,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return listtiles3[index];
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
