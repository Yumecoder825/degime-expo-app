import 'package:degime_131/screen/FolderCreate_page.dart';
import 'package:degime_131/utils/Cancelbutton.dart';
import 'package:degime_131/utils/Global_variable.dart';
import 'package:degime_131/utils/Okbutton.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/screen/Menu_page.dart';
import 'package:degime_131/screen/Chattingfield_page.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// import 'package:degime_131/screen/Menu_page2.dart';
// import 'package:degime_131/screen/Menu_page3.dart';

class MyListTile extends StatefulWidget {
  final String imagePath;
  final double svgRight;
  final String title;
  final String subtitle;
  final MyReturnButton? myReturnButton;
  final Function()? changeSetting;
  final bool isFirstPage;

  MyListTile({
    Key? key,
    this.myReturnButton,
    required this.title,
    this.changeSetting,
    required this.subtitle,
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
                child: widget.imagePath.contains('assets')
                    ? Image.asset(
                        widget.imagePath,
                        width: 50,
                      )
                    : Image.network(
                        widget.imagePath,
                        width: 50,
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
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.subtitle,
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
                onPressed: widget.changeSetting,
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

  @override
  void initState() {
    super.initState();
    GlobalVariables.getMember();
    GlobalVariables.getRoom();
  }

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
                                  // const Positioned(
                                  //   top: 25,
                                  //   right: 5,
                                  //   child: CircleAvatar(
                                  //     radius: 8.0,
                                  //     backgroundColor: Colors.red,
                                  //     child: Text('3',
                                  //         style: TextStyle(
                                  //             fontSize: 10,
                                  //             color: Colors.white,
                                  //             fontWeight: FontWeight.bold)),
                                  //   ),
                                  // ),
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
                                  // const Positioned(
                                  //   top: 25,
                                  //   right: 5,
                                  //   child: CircleAvatar(
                                  //     radius: 8.0,
                                  //     backgroundColor: Color(0xFF9747FF),
                                  //     child: Text('5',
                                  //         style: TextStyle(
                                  //             fontSize: 10,
                                  //             color: Colors.white,
                                  //             fontWeight: FontWeight.bold)),
                                  //   ),
                                  // ),
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
  @override
  void initState() {
    super.initState();
    GlobalVariables.getMember();
  }

  Future<void> changeSetting(String member, String settingname) async {
    var url = Uri.parse(
        'http://194.87.199.12:5000/social/private/contactdata?is_chat_available=${settingname}');
    var data = {"member": member};

    final requestbody = jsonEncode(data);
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${GlobalVariables.token}'
        },
        body: requestbody);
    await GlobalVariables.getMember();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: ListView.builder(
      itemCount: GlobalVariables.memberlist.length,
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return (GlobalVariables.memberlist[index]["is_incoming"] == "True" &&
                GlobalVariables.memberlist[index]["is_chat_available"] ==
                    "False"
            ? MyListTile(
                imagePath:
                    GlobalVariables.memberlist[index]["member_avatar"] != null
                        ? GlobalVariables.memberlist[index]["member_avatar"]
                        : 'assets/images/defaultavatar.png',
                title: GlobalVariables.memberlist[index]["member"],
                subtitle: GlobalVariables.memberlist[index]["member_email"],
                svgRight: 0,
                isFirstPage: true,
                changeSetting: () {
                  changeSetting(
                      GlobalVariables.memberlist[index]["member"], "True");
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ChatPage(
                              index: 0, addFolder: [], folderName: '')));
                },
              )
            : 0.height);
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
  final String roomname;
  bool isSelected;

  Item(this.path, this.title, this.roomname, {this.isSelected = false});
}

class _SecondScreen extends State<SecondScreen> {
  List<Item> items = [];
  Set<int> selectedIndexes = {};
  bool isSelectionMode = false;

  Future<void> deleteRoom(String roomname) async {
    var url = Uri.parse(
        'http://194.87.199.12:5000/social/private/chatroom?room_name=${roomname}');
    var response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'token ${GlobalVariables.token}'
      },
    );
    await GlobalVariables.getRoom();
    Navigator.of(context).pop();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ChatPage(
                  folderName: '',
                  index: 0,
                  addFolder: [],
                )));
  }

  @override
  void initState() {
    super.initState();
    GlobalVariables.getRoom();
    for (var json in GlobalVariables.chatroom) {
      if (json["member"].length == 2) {
        items.add(Item(
            json["member"][0]['username'] == GlobalVariables.username
                ? json["member"][1]['avatar'].toString()
                : json["member"][0]['avatar'].toString(),
            json["chat_group"],
            json["room_name"]));
      } else {
        items.add(Item(
            'assets/images/group.png', json["chat_group"], json["room_name"]));
      }
    }
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
        deleteRoom(GlobalVariables.chatroom[index]["room_name"]);
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
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Container(
                        child: item.path.contains("http")
                            ? Image.network(
                                item.path,
                                width: 50,
                                height: 50,
                              )
                            : item.path.contains("assets")
                                ? Image.asset(
                                    item.path,
                                    width: 50,
                                    height: 50,
                                  )
                                : Image.asset(
                                    "assets/images/defaultavatar.png",
                                    width: 50,
                                    height: 50,
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
                title: Text(item.title),
                onTap: () async {
                  if (isSelectionMode) {
                    setState(() {
                      toggleItemSelection(index);
                    });
                  } else {
                    var websocketUrl =
                        'ws://194.87.199.12:5000/chat/${item.roomname}/${GlobalVariables.token}/${GlobalVariables.username}';
                    var channel = WebSocketChannel.connect(
                      Uri.parse(websocketUrl),
                    );
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ChattingField(
                              member: GlobalVariables.chatroom[index]),
                        ));
                    GlobalVariables.index = index;
                    GlobalVariables.channel = channel;
                    GlobalVariables.messages = [];
                    channel.stream.listen((message) {
                      setState(() {
                        print(message);
                        GlobalVariables.messages.add(message);
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ChattingField(
                                        member: GlobalVariables
                                            .chatroom[GlobalVariables.index])));
                      });
                    });
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
            }),
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
                                          Navigator.of(context).pop();
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
                                    Cancelbutton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
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
