import 'package:degime_131/screen/Login_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:degime_131/utils/Okbutton.dart';
import 'package:degime_131/utils/Cancelbutton.dart';

class ReleaseSNS extends StatefulWidget {
  const ReleaseSNS({super.key});
  static String tag = "/LandingPage";
  @override
  State<ReleaseSNS> createState() => _ReleaseSNS();
}

class _ReleaseSNS extends State<ReleaseSNS> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Widget CardTitle(String string, String path, double size) {
      return Container(
          width: screenWidth * 0.8,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFF2AC3FF),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: ListTile(
            leading: Image.asset(path),
            onTap: () {},
            title: Text(
              string,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ));
    }

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
                                          'assets/images/sea.png'),
                                      width: screenWidth,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        width: screenWidth,
                                        height: 450,
                                        child: Card(
                                            margin: EdgeInsets.all(0),
                                            elevation: 10,
                                            color: Color(0xFFFF7272),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              children: [
                                                40.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Column(children: [
                                                      const Text(
                                                        "はるこ",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      10.height,
                                                      const Text(
                                                        "私は、はるこです。あいうえおかき \nくけこさしすせそたちつてと",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    ])
                                                  ],
                                                ),
                                                10.height,
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CardTitle(
                                                          'https://twitter.com/mypage',
                                                          'assets/images/instagram.png',
                                                          16)
                                                    ]),
                                                5.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CardTitle(
                                                        'https://twitter.com/mypage',
                                                        'assets/images/google_plus.png',
                                                        16)
                                                  ],
                                                ),
                                                5.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CardTitle(
                                                        '@techliciousmedia',
                                                        'assets/images/tiktok.png',
                                                        16)
                                                  ],
                                                ),
                                                5.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CardTitle(
                                                        'お問い合わせ',
                                                        'assets/images/mail.png',
                                                        16)
                                                  ],
                                                ),
                                                5.height,
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CardTitle(
                                                        'https://www.facebook.com/haruko',
                                                        'assets/images/facebook.png',
                                                        14)
                                                  ],
                                                ),
                                              ],
                                            )))
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              top: 110,
                              left: screenWidth / 2 - 39,
                              child: const Image(
                                image: AssetImage('assets/images/avatar.png'),
                                fit: BoxFit.cover,
                                width: 80,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]))),
      bottomSheet: Container(
          height: 50,
          width: screenWidth,
          color: Colors.grey.withOpacity(0.3),
          child: Container(
              alignment: Alignment.center,
              child: Container(
                width: 200,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: RadialGradient(
                        colors: [Color(0xFF7A54FF), Color(0xFFFF7D54)],
                        center: Alignment.center,
                        radius: 3)),
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: const Text(
                              'どちらに保存しますか？',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Okbutton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                              transitionDuration:
                                                  Duration(milliseconds: 300),
                                              pageBuilder: (context, animation,
                                                  secondaryAnimation) {
                                                return SlideTransition(
                                                  position: Tween<Offset>(
                                                    begin: Offset(0, 1),
                                                    end: Offset.zero,
                                                  ).animate(animation),
                                                  child: LoginPage(),
                                                );
                                              }));
                                    },
                                    string: 'ビジネス',
                                  ),
                                  Cancelbutton(
                                    onPressed: () {},
                                    string: 'プライベート',
                                  )
                                ],
                              )
                            ],
                          );
                        });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text(
                    '保存する',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))),
    );
  }
}
