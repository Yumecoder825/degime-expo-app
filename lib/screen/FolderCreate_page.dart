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

class CreateFolder extends StatefulWidget {
  String folderName;
  CreateFolder({super.key,required this.folderName});
  static String tag = "/CreateFolder";
  @override
  State<CreateFolder> createState() => _CreateFolder();
}

class Item {
  final String path;
  final String title;
  final String subtitle;
  bool isSelected;

  Item(this.path, this.title, this.subtitle, {this.isSelected = false});
}

class _CreateFolder extends State<CreateFolder> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
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
                      10.height,
                    ],
                  ),
                )),
            Expanded(
              child: SecondScreen(
                folderName: widget.folderName,
              ),
            ),
          ],
        ));
  }
}

class SecondScreen extends StatefulWidget {
  String folderName;
  SecondScreen({super.key,required this.folderName});
  @override
  State<SecondScreen> createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  List<Widget> _appBarImage = [];
  List<Widget> _appBar = [];
  List<Item> items = [];
  Set<int> selectedIndexes = {};
  Map<int, int> selectedItems = {};
  bool isSelectionMode = false;
  int leng = 0;

  @override
  void initState() {
    super.initState();
    items = [
      Item('assets/images/avatar1.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar2.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar3.png', 'Jane Cooper',
          '(270)555-0117, 2019/1/20'),
      Item('assets/images/avatar2.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar1.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar2.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar3.png', 'Jane Cooper',
          '(270)555-0117, 2019/1/20'),
      Item('assets/images/avatar2.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar1.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar2.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
      Item('assets/images/avatar3.png', 'Jane Cooper',
          '(270)555-0117, 2019/1/20'),
      Item('assets/images/avatar2.png', 'Jane Cooper',
          '(270)555-0117, 2019/11/20'),
    ];
    selectedIndexes = {};
    for (int i = 0; i < items.length; i++) {
      _appBarImage.add((Image.asset(
        items[i].path,
        width: 50,
        height: 50,
      )));
    }
  }

  void toggleItemSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
        _appBar.remove(_appBarImage[index]);
      } else {
        selectedIndexes.add(index);
        _appBar.add(_appBarImage[index]);
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
    //TextEditingController _controller = TextEditingController();
    return WillPopScope(
      onWillPop: () async {
        if (isSelectionMode) {
          setState(() {
            selectedIndexes.clear();
            isSelectionMode = false;
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          appBar: AppBar(
              toolbarHeight: isSelectionMode ? 60 : 0,
              backgroundColor: Colors.white,
              leadingWidth: 0,
              title: isSelectionMode
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: _appBar),
                    )
                  : null),
          body: ListView.builder(
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index != items.length) {
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
                    }
                  },
                  onLongPress: () {
                    _appBar = [];
                    setState(() {
                      isSelectionMode = true;
                      toggleItemSelection(index);
                    });
                  },
                  tileColor: selectedIndexes.contains(index)
                      ? Colors.grey.withOpacity(0.3)
                      : null,
                );
              } else {
                return Container(
                  height: isSelectionMode ? 50 : 0,
                );
              }
            },
          ),
          bottomSheet: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            height: isSelectionMode ? 50 : 0,
            child: SizedBox(
                width: 150,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    backgroundColor: const Color(0xFFFF8F61),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    print(_appBar);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ChatPage(
                                  addFolder: _appBar,
                                  index: 1,
                                  folderName: widget.folderName,
                                )));
                  },
                  child: const Text(
                    "完成",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )),
          )),
    );
  }
}
