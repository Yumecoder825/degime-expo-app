import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/screen/Menu_page.dart';

class MyPopupMenuButton extends StatelessWidget {
  final Function()? onDelete;
  final String? svgPath;

  const MyPopupMenuButton({
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
          child: const Text('削除する'),
          onTap: () {},
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 1') {
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
  final MyPopupMenuButton? myPopupMenuButton;
  final MyReturnButton? myReturnButton;
  final Function()? onTap;
  final bool isFirstPage;

  const MyListTile({
    Key? key,
    this.myReturnButton,
    required this.imagePath,
    required this.svgRight,
    this.myPopupMenuButton,
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
              width: 80,
              alignment: Alignment.centerRight,
              child: isFirstPage ? myPopupMenuButton : myReturnButton),
          onTap: () {},
        ));
  }
}

class BCardManagePage extends StatefulWidget {
  const BCardManagePage({super.key});
  static String tag = "/BCardManagePage";
  @override
  State<BCardManagePage> createState() => _BCardManagePage();
}

class _BCardManagePage extends State<BCardManagePage> {
  TextEditingController _controller = TextEditingController();
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
                                                                fit:
                                                                    BoxFit.fill,
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                    10.width,
                                                    PopupMenuButton<String>(
                                                      icon: const Icon(
                                                          Icons.menu),
                                                      iconSize: 25,
                                                      onSelected: (value) {
                                                        setState(() {
                                                          if (value ==
                                                              'Option 1') {
                                                            MenuPage1(
                                                                    isVisible1:
                                                                        true,
                                                                    isVisible2:
                                                                        false,
                                                                    isVisible3:
                                                                        false)
                                                                .launch(
                                                                    context);
                                                          } else if (value ==
                                                              'Option 2') {
                                                            MenuPage1(
                                                                    isVisible1:
                                                                        false,
                                                                    isVisible2:
                                                                        true,
                                                                    isVisible3:
                                                                        false)
                                                                .launch(
                                                                    context);
                                                          } else if (value ==
                                                              'Option 3') {
                                                            MenuPage1(
                                                                    isVisible1:
                                                                        false,
                                                                    isVisible2:
                                                                        false,
                                                                    isVisible3:
                                                                        true)
                                                                .launch(
                                                                    context);
                                                          }
                                                        });
                                                        // Perform action based on the selected value
                                                        print(
                                                            'Selected: $value');
                                                      },
                                                      itemBuilder: (BuildContext
                                                              context) =>
                                                          const [
                                                        PopupMenuItem<String>(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          value: 'Option 1',
                                                          child: Text('非通知一覧'),
                                                        ),
                                                        PopupMenuItem<String>(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          value: 'Option 2',
                                                          child: Text('ブロック一覧'),
                                                        ),
                                                        PopupMenuItem<String>(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10),
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
                                          top: 60,
                                          left: screenWidth * 0.1,
                                          child: (SizedBox(
                                              width: screenWidth * 0.8,
                                              height: 40,
                                              child: TextField(
                                                controller: _controller,
                                                decoration: InputDecoration(
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  hintText: '検索',
                                                  suffixIcon: IconButton(
                                                      icon: const Icon(
                                                          Icons.cancel),
                                                      onPressed: () {
                                                        _controller.clear();
                                                      }),
                                                  suffixIconColor: Colors.white,
                                                  hintStyle: const TextStyle(
                                                      color: Colors.white),
                                                  prefixIcon: const Icon(
                                                      Icons.search_outlined),
                                                  prefixIconColor: Colors.white,
                                                  constraints:
                                                      const BoxConstraints(),
                                                  contentPadding:
                                                      const EdgeInsets.all(0),
                                                  fillColor:
                                                      const Color(0xFFDADADA),
                                                  filled: true,
                                                ),
                                                style: const TextStyle(
                                                    fontSize: 18),
                                                textAlign: TextAlign.left,
                                                cursorColor: Colors.white,
                                              )))),
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
                              TabBar(
                                indicatorColor: const Color(0xFF9747FF),
                                indicatorSize: TabBarIndicatorSize.label,
                                unselectedLabelColor: Colors.black,
                                labelColor: const Color(0xFF9747FF),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                tabs: [
                                  Tab(
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          top: 13,
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 12.0,
                                            backgroundColor: Color(0xFFFFDD55),
                                            child: Text('5',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 120,
                                          child: const Text(
                                            'ビジネス',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Tab(
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          top: 13,
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 12.0,
                                            backgroundColor: Color(0xFFFFDD55),
                                            child: Text('5',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 148,
                                          child: Text(
                                            'プライベート',
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ).expand()
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(2);
            //listtiles.add(listtiles[0]);
          });
          Navigator.pop(context);
        },
      ),
    ),
        MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(2);
            //listtiles.add(listtiles[0]);
          });
          Navigator.pop(context);
        },
      ),
    ),
        MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(2);
            //listtiles.add(listtiles[0]);
          });
          Navigator.pop(context);
        },
      ),
    ),
        MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/setting.svg',
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
