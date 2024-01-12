import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:degime_131/screen/Login_page.dart';
import 'package:degime_131/screen/Menu_page.dart';

class LandingNext extends StatefulWidget {
  const LandingNext({super.key});
  static String tag = "/LandingNext";
  @override
  State<LandingNext> createState() => _LandingNext();
}

class _LandingNext extends State<LandingNext> {
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
                            child: const Image(
                              image: AssetImage('assets/images/avatar.png'),
                              fit: BoxFit.cover,
                              width: 80,
                            ),
                          ),
                          const Positioned(
                            top: 0,
                            left: 0,
                            child: Image(
                              image:
                                  AssetImage('assets/images/degime_logo.png'),
                              width: 60,
                              fit: BoxFit.cover,
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
                      Column(children: [
                        const Text(
                          "はるこ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        10.height,
                        const Text(
                          "https://myprofile.co",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                    SizedBox(
                        width: screenWidth * 0.8,
                        height: 40,
                        child: Stack(
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                LoginPage().launch(context);
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF2AC3FF),
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                  ]),
                  10.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        width: screenWidth * 0.8,
                        height: 40,
                        child: Stack(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF2AC3FF),
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
                  ]),
                  10.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        width: screenWidth * 0.8,
                        height: 40,
                        child: Stack(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF2AC3FF),
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ランティングページ',
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
                  ]),
                  50.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        width: screenWidth * 0.6,
                        height: 35,
                        child: Stack(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF96DA45),
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'チャット',
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
                                top: 6,
                                left: screenWidth * 0.38,
                                child: const Image(
                                  image: AssetImage('assets/images/circle.png'),
                                  width: 15,
                                  height: 15,
                                  color: Color(0xFFFF8F61),
                                  fit: BoxFit.fill,
                                )),
                            Positioned(
                                top: 7,
                                left: screenWidth * 0.38 + 4,
                                child: const Text(
                                  "5",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 11),
                                )),
                          ],
                        )),
                  ]),
                  10.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        width: screenWidth * 0.6,
                        height: 35,
                        child: Stack(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xFF96DA45),
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
                  ]),
                ]),
          ),
        ));
  }
}
