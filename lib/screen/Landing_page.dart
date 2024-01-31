import 'package:degime_131/main.dart';
import 'package:degime_131/screen/BCardManage_page2.dart';
import 'package:degime_131/screen/ChatApply_page.dart';
import 'package:degime_131/screen/Chat_page.dart';
import 'package:degime_131/screen/DataManage_page.dart';
import 'package:degime_131/screen/Landing_next.dart';
import 'package:degime_131/screen/Menu_page.dart';
import 'package:degime_131/screen/Setting_page.dart';
import 'package:degime_131/screen/Shop_page1.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:degime_131/screen/Login_page.dart';
import 'package:degime_131/screen/Theme_select.dart';
import 'package:flutter/services.dart';
import 'package:degime_131/utils/Global_variable.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static String tag = "/LandingPage";
  @override
  State<LandingPage> createState() => _LandingPage();
}

class _LandingPage extends State<LandingPage> {
  bool _isPressed = false;
  bool _isPressed1 = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _isPressed4 = false;
  bool _isPressed5 = false;
  bool _isPressed6 = false;
  bool _isPressed7 = false;
  bool _isPressed8 = false;
  bool _isPressed9 = false;
  bool _isPressed10 = false;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: const Color(0xFFF2F2F7),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                                  Image(
                                    image: const AssetImage(
                                        'assets/images/slash_image.png'),
                                    width: screenWidth,
                                    height: 180,
                                    fit: BoxFit.cover,
                                  ),
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
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              value: 'Option 1',
                                              child: Text('非通知一覧'),
                                            ),
                                            PopupMenuItem<String>(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              value: 'Option 2',
                                              child: Text('ブロック一覧'),
                                            ),
                                            PopupMenuItem<String>(
                                              padding:
                                                  EdgeInsets.only(left: 10),
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
                              top: 130,
                              left: screenWidth / 2 - 39,
                              child: GlobalVariables.landingavatar == ""
                                  ? Image(
                                      image: AssetImage(
                                          'assets/images/defaultavatar.png'),
                                      fit: BoxFit.cover,
                                      width: 80,
                                    )
                                  : Image.network(
                                      GlobalVariables.landingavatar,
                                      fit: BoxFit.cover,
                                      width: 80,
                                    )),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Image(
                              image:
                                  AssetImage('assets/images/degime_logo.png'),
                              fit: BoxFit.cover,
                              width: 100,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              GlobalVariables.landingname,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            10.height,
                            Row(
                              children: [
                                Text(
                                  GlobalVariables.landingurl,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                GlobalVariables.landingurl != ""
                                    ? IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.copy))
                                    : 0.width
                              ],
                            )
                          ])
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screenWidth * 0.8,
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
                          ))
                    ],
                  ),
                  30.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: _isPressed
                              ? screenWidth * 0.9
                              : screenWidth * 0.8,
                          // Increase width when pressed
                          height: 40, // Increase height when pressed
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    if (GlobalVariables.token != '') {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ThemeSelect2()));
                                    } else
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  LoginPage()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: _isPressed
                                        ? Colors.blue
                                        : Color(0xFF2AC3FF),
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'オンライン名刺編集',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )),
                              Positioned(
                                top: 8.5,
                                left: screenWidth * 0.8 - 36,
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    )
                  ]),
                  30.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed1 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed1 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed1 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: _isPressed1
                              ? screenWidth * 0.9
                              : screenWidth * 0.8,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  if (GlobalVariables.token != '') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ThemeSelect1(),
                                        ));
                                  } else
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginPage()));
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _isPressed1
                                      ? Colors.blue
                                      : Color(0xFF2AC3FF),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'SNS向けリンクツリー',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 8.5,
                                left: screenWidth * 0.8 - 36,
                                child: const Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    )
                  ]),
                  20.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed2 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed2 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed2 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: _isPressed2
                              ? screenWidth * 0.7
                              : screenWidth * 0.6,
                          // Increase width when pressed
                          height: 35,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _isPressed2
                                      ? Colors.green
                                      : Color(0xFF96DA45),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '名刺管理',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              // Positioned(
                              //     top: 1,
                              //     left: _isPressed2
                              //         ? screenWidth * 0.43
                              //         : screenWidth * 0.38,
                              //     child: const Image(
                              //       image:
                              //           AssetImage('assets/images/circle.png'),
                              //       width: 15,
                              //       height: 15,
                              //       color: Color(0xFFFF8F61),
                              //       fit: BoxFit.fill,
                              //     )),
                              // Positioned(
                              //     top: 2,
                              //     left: _isPressed2
                              //         ? screenWidth * 0.43 + 4
                              //         : screenWidth * 0.38 + 4,
                              //     child: const Text(
                              //       "5",
                              //       style: TextStyle(
                              //           color: Colors.white, fontSize: 11),
                              //     )),
                            ],
                          )),
                    )
                  ]),
                  20.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed3 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed3 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed3 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: _isPressed3
                              ? screenWidth * 0.7
                              : screenWidth * 0.6,
                          // Increase width when pressed
                          height: 35,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  const LandingNext().launch(context);
                                  showAlertDialog(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _isPressed3
                                      ? Color.fromARGB(255, 255, 94, 0)
                                      : Color(0xFFFF8F61),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'degimeカードに書き込む',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ]),
                  10.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed4 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed4 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed4 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: _isPressed4
                              ? screenWidth * 0.7
                              : screenWidth * 0.6,
                          // Increase width when pressed
                          height: 35,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: _isPressed4
                                      ? Color.fromARGB(255, 247, 77, 15)
                                      : Color(0xFFDA8D45),
                                  side: BorderSide.none,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'degimeカード購入する',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ]),
                  70.height
                ]),
          ),
        ),
        bottomSheet: Container(
            height: 60,
            decoration: const BoxDecoration(color: Color(0xFFF2F2F7)),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed5 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed5 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed5 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          width: _isPressed5 ? 90 : 40,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ChatPage(
                                                  index: 0,
                                                  folderName: '',
                                                  addFolder: [],
                                                )));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: _isPressed5
                                        ? Color(0xFF7A54FF)
                                        : Colors.white,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: _isPressed5
                                      ? Container(
                                          width: 90,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: 40,
                                                height: 40,
                                                child: const Image(
                                                  image: AssetImage(
                                                      'assets/images/chatbottom.png'),
                                                  width: 30,
                                                  height: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Text(
                                                'チャット',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              )
                                            ],
                                          ),
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/chatbottom.png'),
                                            width: 30,
                                            height: 30,
                                            //fit: BoxFit.cover,
                                          ),
                                        )),
                              Positioned(
                                  top: 1,
                                  left: _isPressed2
                                      ? screenWidth * 0.43
                                      : screenWidth * 0.38,
                                  child: const Image(
                                    image:
                                        AssetImage('assets/images/circle.png'),
                                    width: 15,
                                    height: 15,
                                    color: Color(0xFFFF8F61),
                                    fit: BoxFit.fill,
                                  )),
                              Positioned(
                                  top: 2,
                                  left: _isPressed2
                                      ? screenWidth * 0.43 + 4
                                      : screenWidth * 0.38 + 4,
                                  child: const Text(
                                    "5",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11),
                                  )),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed6 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed6 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed6 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          width: _isPressed6 ? 90 : 40,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ShopPage1()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: _isPressed6
                                        ? Color(0xFF7A54FF)
                                        : Colors.white,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: _isPressed6
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: const Image(
                                                image: AssetImage(
                                                    'assets/images/shopbottom.png'),
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'ショップ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/shopbottom.png'),
                                            width: 30,
                                            height: 30,
                                            //fit: BoxFit.cover,
                                          ),
                                        )),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed7 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed7 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed7 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          width: _isPressed7 ? 90 : 40,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () async {
                                    await GlobalVariables.getMember();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                BCardManagePage2()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: _isPressed7
                                        ? Color(0xFF7A54FF)
                                        : Colors.white,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: _isPressed7
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: const Image(
                                                image: AssetImage(
                                                    'assets/images/contactbottom.png'),
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              '名刺管理',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/contactbottom.png'),
                                            width: 30,
                                            height: 30,
                                            //fit: BoxFit.cover,
                                          ),
                                        )),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed8 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed8 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed8 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          width: _isPressed8 ? 80 : 40,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: _isPressed8
                                        ? Color(0xFF7A54FF)
                                        : Colors.white,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: _isPressed8
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: const Image(
                                                image: AssetImage(
                                                    'assets/images/topbottom.png'),
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'トップ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/topbottom.png'),
                                            width: 30,
                                            height: 30,
                                            //fit: BoxFit.cover,
                                          ),
                                        )),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed9 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed9 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed9 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          width: _isPressed9 ? 100 : 40,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                DataManage()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: _isPressed9
                                        ? Color(0xFF7A54FF)
                                        : Colors.white,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: _isPressed9
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: const Image(
                                                image: AssetImage(
                                                    'assets/images/databottom.png'),
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              'データ管理',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          child: const Image(
                                            image: AssetImage(
                                                'assets/images/databottom.png'),
                                            width: 30,
                                            height: 30,
                                            //fit: BoxFit.cover,
                                          ),
                                        )),
                            ],
                          )),
                    ),
                    GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        setState(() {
                          _isPressed10 = true;
                        });
                      },
                      onTapUp: (TapUpDetails details) {
                        setState(() {
                          _isPressed10 = false;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          _isPressed10 = false;
                        });
                      },
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 0),
                          width: _isPressed10 ? 70 : 40,
                          // Increase width when pressed
                          height: 40,
                          child: Stack(
                            children: [
                              OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext contex) =>
                                                SettingPage()));
                                  },
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: _isPressed10
                                        ? Color(0xFF7A54FF)
                                        : Colors.white,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: _isPressed10
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              child: const Image(
                                                image: AssetImage(
                                                    'assets/images/settingbottom.png'),
                                                width: 30,
                                                height: 30,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const Text(
                                              '設定',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12),
                                            )
                                          ],
                                        )
                                      : Container(
                                          width: 40,
                                          height: 40,
                                          child: const Image(
                                              image: AssetImage(
                                                  'assets/images/settingbottom.png'),
                                              width: 30,
                                              height: 30,
                                              color: Color(0xFF7A54FF)
                                              //fit: BoxFit.cover,
                                              ),
                                        )),
                            ],
                          )),
                    ),
                  ]),
            )));
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = Container(
    alignment: Alignment.center,
    width: 75,
    height: 36,
    child: OutlinedButton(
        onPressed: () {
          const LandingPage().launch(context);
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          backgroundColor: const Color(0xFF96DA45),
          side: BorderSide.none,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        child: const Text(
          "戻る",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        )),
  );
  AlertDialog alert = AlertDialog(
    content: const Text(
      "書き込むURLがありません。ページの作成をお願いします。",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    actions: [
      Center(
        child: okButton,
      ),
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext) {
        return alert;
      });
}
