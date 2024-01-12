import 'package:degime_131/screen/FolderCreate_page.dart';
import 'package:degime_131/utils/Cancelbutton.dart';
import 'package:degime_131/utils/Okbutton.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/screen/Menu_page.dart';
import 'package:degime_131/screen/Chattingfield_page.dart';

// import 'package:degime_131/screen/Menu_page2.dart';
// import 'package:degime_131/screen/Menu_page3.dart';

class MyListTile extends StatefulWidget {
  final String imagePath;
  final double svgRight;
  final MyReturnButton? myReturnButton;
  final bool isFirstPage;

  MyListTile({
    Key? key,
    this.myReturnButton,
    required this.imagePath,
    required this.svgRight,
    required this.isFirstPage,
  }) : super(key: key);

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      leading: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: const Offset(0, 2),
                      blurRadius: 3)
                ]),
                child: Image.asset(
                  widget.imagePath,
                  width: 50,
                  height: 50,
                ),
              )),
          5.width,
          const Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
      title: const Text(
        'Jane Cooper',
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text('(270)555-0117, 2019/11/20',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8A8A8D))),
      onTap: () {},
      trailing: IconButton(
        icon: SvgPicture.asset('assets/images/apply.svg'),
        iconSize: 60,
        onPressed: () {
          Widget okButton = Container(
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
              "本当にこのユーザーをチャットに承認しますか？",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
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
        },
      ),
    ));
  }
}

class ChatPage extends StatefulWidget {
  ChatPage(
      {super.key,
      required this.index,
      required this.addFolder,
      required this.folderName});
  List<Widget> addFolder;
  int index = 0;
  String folderName;
  static String tag = "/ChatPage";
  @override
  State<ChatPage> createState() => _ChatPage();
}

class _ChatPage extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();
  late List<MyListTile> listtiles = [
    MyListTile(
      imagePath: 'assets/images/avatar1.png',
      svgRight: 100,
      isFirstPage: true,
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: true,
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    //bool isSelected = false;

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                  color: Color.fromARGB(255, 240, 235, 235),
                  height: 250,
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
                                      'チャットページ',
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
                                            contentPadding:
                                                const EdgeInsets.all(0),
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
                                    top: 25,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor: Colors.red,
                                      child: Text('3',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    child: const Text(
                                      '申請者',
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
                                    top: 25,
                                    right: 5,
                                    child: CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor: Color(0xFF9747FF),
                                      child: Text('5',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    child: const Text(
                                      '承認者',
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  child: TabBarView(children: [
                FirstScreen(),
                SecondScreen(
                  addFolder: widget.addFolder,
                  index: widget.index,
                  folderName: widget.folderName,
                )
              ]))
            ],
          ),
        ));
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
    ),
    MyListTile(
      imagePath: 'assets/images/avatar2.png',
      svgRight: 0,
      isFirstPage: true,
    ),
    MyListTile(
      imagePath: 'assets/images/avatar3.png',
      svgRight: 100,
      isFirstPage: true,
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
  String folderName;
  List<Widget> addFolder = [];
  int index;
  SecondScreen(
      {super.key,
      required this.folderName,
      required this.addFolder,
      required this.index});
  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class Item {
  final String path;
  final String title;
  final String subtitle;
  bool isSelected;

  Item(this.path, this.title, this.subtitle, {this.isSelected = false});
}

class _SecondScreen extends State<SecondScreen> {
  List<Item> items = [];
  Set<int> selectedIndexes = {};
  bool isSelectionMode = false;

  @override
  void initState() {
    super.initState();
    items = [
      Item('assets/images/avatar1.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar2.png', 'Ginger Heart',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar3.png', 'Tsubasa Fujimoto',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar1.png', 'John Yippy',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar3.png', 'Kittisak Mortar',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar2.png', 'Ananda Govindasamy',
          '(270)555-0117, 2019/11/20'),
    ];
    selectedIndexes = {};
  }

  void toggleItemSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  void deleteSelectedItems() {
    setState(() {
      final List<int> indexesToRemove = selectedIndexes.toList();
      indexesToRemove
          .sort((a, b) => b.compareTo(a)); // Sort in descending order
      for (final index in indexesToRemove) {
        items.removeAt(index);
      }
      selectedIndexes.clear();
      isSelectionMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return WillPopScope(
      onWillPop: () async {
        if (isSelectionMode) {
          setState(() {
            selectedIndexes.clear();
            isSelectionMode = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isSelectionMode ? 40 : 0,
          backgroundColor: Colors.white,
          actions: [
            if (isSelectionMode)
              Container(
                margin: EdgeInsets.only(right: 17),
                child: IconButton(
                  onPressed: () {
                    Widget okButton = Container(
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      width: 140,
                      height: 35,
                      child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              deleteSelectedItems();
                            });
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                width: 1.0, color: Colors.black),
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
                      content: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: '本当に削除しますか？',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: '\nチャット内容はすべて消去されます',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ]),
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
                  icon: Icon(Icons.delete),
                  iconSize: 25,
                  color: Colors.black,
                ),
              )
          ],
        ),
        body: ListView.builder(
          itemCount: widget.index == 0 ? items.length : items.length + 1,
          itemBuilder: (context, index) {
            if (index == items.length) {
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'グループ',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ))),
                trailing: isSelectionMode
                    ? Checkbox(
                        value: selectedIndexes.contains(index),
                        onChanged: (value) {
                          setState(() {
                            toggleItemSelection(index);
                          });
                        },
                        shape: const CircleBorder(),
                      )
                    : null,
                title: Text(widget.folderName),
                onTap: () {
                  if (isSelectionMode) {
                    setState(() {
                      toggleItemSelection(index);
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChattingField(addFolder: widget.addFolder),
                        ));
                  }
                },
                tileColor: selectedIndexes.contains(index)
                    ? Colors.grey.withOpacity(0.3)
                    : null,
              );
            } else {
              final item = items[index];
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            offset: const Offset(0, 2),
                            blurRadius: 3)
                      ]),
                      child: Image.asset(
                        item.path,
                        width: 50,
                        height: 50,
                      ),
                    )),
                trailing: isSelectionMode
                    ? Checkbox(
                        value: selectedIndexes.contains(index),
                        onChanged: (value) {
                          setState(() {
                            toggleItemSelection(index);
                          });
                        },
                        shape: const CircleBorder(),
                      )
                    : null,
                title: Text(item.title),
                subtitle: Text(item.subtitle),
                onTap: () {
                  if (isSelectionMode) {
                    setState(() {
                      toggleItemSelection(index);
                    });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChattingField(
                            imagePath: item.path,
                            title: item.title,
                            subtitle: item.subtitle,
                            addFolder: [],
                          ),
                        ));
                  }
                },
                onLongPress: () {
                  setState(() {
                    isSelectionMode = true;
                    toggleItemSelection(index);
                  });
                },
                tileColor: selectedIndexes.contains(index)
                    ? Colors.grey.withOpacity(0.3)
                    : null,
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text(
                      '新しいグループを作成しますか？',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Okbutton(onPressed: () {
                            Navigator.pop(context);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: TextField(
                                      controller: _controller,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                              color: Colors.black),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        hintText: 'グループ名を入力',
                                      )),
                                  actions: [
                                    Okbutton(
                                      onPressed: () {
                                        setState(() {
                                          widget.folderName = _controller.text;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreateFolder(
                                                      folderName:
                                                          widget.folderName,
                                                    )));
                                        print(widget.folderName);
                                      },
                                    ),
                                    Cancelbutton()
                                  ],
                                );
                              },
                            );
                          }),
                          Cancelbutton()
                        ],
                      )
                    ],
                  );
                });
          },
          backgroundColor: Color(0xFFFF8F61),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
