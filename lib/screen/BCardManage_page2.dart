import 'package:degime_131/utils/ComTextfield.dart';
import 'package:degime_131/utils/FunctionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';
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
      icon: SvgPicture.asset(svgPath!),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
            height: 40,
            value: 'Option 1',
            onTap: () {},
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'チャットを申請する',
                textAlign: TextAlign.center,
              ),
            )),
        PopupMenuItem<String>(
          height: 40,
          value: 'Option 2',
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'プロフィールページを表示',
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {},
        ),
        PopupMenuItem<String>(
          height: 40,
          value: 'Option 3',
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              '非通知',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        PopupMenuItem<String>(
          height: 40,
          value: 'Option 4',
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'ブロック',
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {},
        ),
        PopupMenuItem<String>(
          height: 40,
          value: 'Option 5',
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              '削除',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'Option 5') {
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
    TextEditingController _controller = TextEditingController();
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xFFB9B9B9), width: 1.0)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
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
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text('2022/11/20保存 2022/11/20更新',
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8A8A8D))),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            width: 120,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  width: 70,
                  child: myPopupMenuButton,
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            titlePadding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            title: Row(
                              children: [
                                Text('メモ'),
                                20.width,
                                Text(formattedDate + " " + formattedTime),
                              ],
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            content: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 150,
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: 1.0)),
                                child: TextField(
                                  controller: _controller,
                                  maxLines: 30,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            actionsPadding: EdgeInsets.all(0),
                            actions: [
                              FunctionButton(
                                title: '更新',
                                fillcolor: Color(0xFF0E9CFF),
                                wordcolor: Colors.white,
                                width: 65,
                                height: 30,
                                bordercolor: Color(0xFF0E9CFF),
                                onPressed: () {},
                              ),
                              FunctionButton(
                                title: 'キャンセル',
                                fillcolor: Colors.white,
                                wordcolor: Color(0xFFB67995),
                                width: 115,
                                height: 30,
                                bordercolor: Color(0xFFB67995),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              IconButton(
                                  onPressed: () {
                                    _controller.clear();
                                  },
                                  icon: Icon(Icons.delete)),
                            ],
                          );
                        });
                  },
                  icon: const Image(
                    image: AssetImage('assets/images/paper.png'),
                    width: 19,
                  ),
                ),
              ],
            ),
          ),

          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset('assets/images/paper.svg'),
          // )
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset('assets/images/paper.svg'),
          //   iconSize: 20,
          // )
          onTap: () {},
        ));
  }
}

class BCardManagePage2 extends StatefulWidget {
  const BCardManagePage2({super.key});
  static String tag = "/BCardManagePage2";
  @override
  State<BCardManagePage2> createState() => _BCardManagePage2();
}

class _BCardManagePage2 extends State<BCardManagePage2>
    with TickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  late TabController _tabcontroller;
  List<Widget> _tabs = [Tab(text: 'ビジネス'), Tab(text: 'プライベート')];
  List<Widget> _tabScreens = [FirstScreen(), SecondScreen()];
  var i = 0;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabcontroller.dispose();
    super.dispose();
  }

  void _addTab() {
    setState(() {
      int newTabIndex = _tabs.length + 1;
      _tabs.add(Tab(
        text: _controller1.text,
      ));
      _tabScreens.add(Container());
      _tabcontroller = TabController(length: _tabs.length, vsync: this);
    });
  }

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
                    expandedHeight: 190,
                    floating: true,
                    pinned: false,
                    automaticallyImplyLeading: false,
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
                                            Container(
                                              width: screenWidth,
                                              height: 100,
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
                                                    icon:
                                                        const Icon(Icons.menu),
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
                                                              .launch(context);
                                                        } else if (value ==
                                                            'Option 2') {
                                                          MenuPage1(
                                                                  isVisible1:
                                                                      false,
                                                                  isVisible2:
                                                                      true,
                                                                  isVisible3:
                                                                      false)
                                                              .launch(context);
                                                        } else if (value ==
                                                            'Option 3') {
                                                          MenuPage1(
                                                                  isVisible1:
                                                                      false,
                                                                  isVisible2:
                                                                      false,
                                                                  isVisible3:
                                                                      true)
                                                              .launch(context);
                                                        }
                                                      });
                                                      // Perform action based on the selected value
                                                      print('Selected: $value');
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
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        LandingPage()));
                                          },
                                        )),
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
                                                          Radius.circular(10)),
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
                                              style:
                                                  const TextStyle(fontSize: 18),
                                              textAlign: TextAlign.left,
                                              cursorColor: Colors.white,
                                            )))),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                                onLongPress: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: Container(
                                            padding: EdgeInsets.all(0),
                                            height: 120,
                                            alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      'フォルダー名を変更・削除する',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                                20.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    ComTextField(
                                                        controller:
                                                            _controller2,
                                                        textheight: 30,
                                                        textwidth: 150,
                                                        callback: (text) {},
                                                        hinttext: ''),
                                                    FunctionButton(
                                                        title: '編集',
                                                        wordcolor: Colors.white,
                                                        width: 65,
                                                        height: 30,
                                                        bordercolor:
                                                            Colors.transparent,
                                                        fillcolor:
                                                            Color(0xFFFF8F61),
                                                        onPressed: () {
                                                          setState(() {
                                                            _tabs[2] = Tab(
                                                              text: _controller2
                                                                  .text,
                                                            );
                                                            _tabcontroller =
                                                                TabController(
                                                                    length: _tabs
                                                                        .length,
                                                                    vsync:
                                                                        this);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        })
                                                  ],
                                                ),
                                                10.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      '削除するとフォルダー内のデータがすべ \nて消去されますがよろしいですか？',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actionsPadding:
                                              EdgeInsets.only(bottom: 10),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FunctionButton(
                                                    title: 'いいえ',
                                                    wordcolor:
                                                        Color(0xFFFF8F61),
                                                    width: 96,
                                                    height: 30,
                                                    fillcolor: Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    }),
                                                30.width,
                                                FunctionButton(
                                                    title: '削除する',
                                                    wordcolor: Colors.white,
                                                    width: 96,
                                                    height: 30,
                                                    bordercolor:
                                                        Colors.transparent,
                                                    fillcolor:
                                                        Color(0xFFFF8F61),
                                                    onPressed: () {
                                                      setState(() {
                                                        _tabs.removeAt(2);
                                                        _tabScreens.removeAt(2);
                                                        _tabcontroller =
                                                            TabController(
                                                                length: _tabs
                                                                    .length,
                                                                vsync: this);
                                                        Navigator.of(context)
                                                            .pop();
                                                      });
                                                    })
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                },
                                child: TabBar(
                                  indicatorColor: Color(0xFF9747FF),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  unselectedLabelColor: Colors.black,
                                  labelColor: Color(0xFF9747FF),
                                  labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  controller: _tabcontroller,
                                  tabs: _tabs,
                                ))
                          ]).expand()
                    ])))),
              ];
            },
            body: TabBarView(
              controller: _tabcontroller,
              children: _tabScreens,
            )),
      ),
      bottomSheet: Container(
          height: 50,
          width: screenWidth,
          child: Container(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFF96DA45)),
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              padding: EdgeInsets.all(0),
                              height: 100,
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'フォルダーを作成する',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  20.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ComTextField(
                                          controller: _controller1,
                                          textheight: 30,
                                          textwidth: 150,
                                          callback: (text) {},
                                          hinttext: ''),
                                      FunctionButton(
                                          title: '登録',
                                          wordcolor: Colors.white,
                                          width: 65,
                                          height: 30,
                                          bordercolor: Colors.transparent,
                                          fillcolor: Color(0xFFFF8F61),
                                          onPressed: () {
                                            _addTab();
                                            Navigator.of(context).pop();
                                          })
                                    ],
                                  )
                                ],
                              ),
                            ),
                            actionsPadding: EdgeInsets.all(0),
                            actions: [],
                          );
                        });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    'マイフォルダ作成・編集',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});
  @override
  State<FirstScreen> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  int selectedIndex = -1;
  late List<MyListTile> listtiles = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/settingdrop.svg',
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
        svgPath: 'assets/images/settingdrop.svg',
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
        svgPath: 'assets/images/settingdrop.svg',
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
        return LongPressDraggable<int>(
          data: index,
          child: DragTarget<int>(
            onWillAccept: (data) => true,
            onAccept: (data) {
              setState(() {
                final draggedElement = listtiles[data];
                listtiles.removeAt(data);
                //listtiles.insert(index, draggedElement);
              });
            },
            builder: (context, candidateData, rejectedData) {
              return listtiles[index];
            },
          ),
          feedback: SizedBox(
            width: 100,
            child: Card(
                child: Image(image: AssetImage(listtiles[index].imagePath))),
          ),
          childWhenDragging: Container(),
        );
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
  int selectedIndex = -1;
  late List<MyListTile> listtiles = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/settingdrop.svg',
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
        svgPath: 'assets/images/settingdrop.svg',
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
        svgPath: 'assets/images/settingdrop.svg',
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
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: true,
      myPopupMenuButton: MyPopupMenuButton(
        svgPath: 'assets/images/settingdrop.svg',
        onDelete: () {
          setState(() {
            listtiles.removeAt(1);
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
        return LongPressDraggable<int>(
          data: index,
          child: DragTarget<int>(
            onWillAccept: (data) => true,
            onAccept: (data) {
              setState(() {
                final draggedElement = listtiles[data];
                listtiles.removeAt(data);
                //listtiles.insert(index, draggedElement);
              });
            },
            builder: (context, candidateData, rejectedData) {
              return listtiles[index];
            },
          ),
          feedback: SizedBox(
            width: 100,
            child: Card(
                child: Image(image: AssetImage(listtiles[index].imagePath))),
          ),
          childWhenDragging: Container(),
        );
        ;
      },
    ));
  }
}
