import 'package:degime_131/screen/BCardManage_page2.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/services.dart';
import 'package:degime_131/utils/Okbutton.dart';
import 'package:degime_131/utils/Cancelbutton.dart';

class ReleaseOnline extends StatefulWidget {
  const ReleaseOnline({super.key});
  static String tag = "/ReleaseOnline";
  @override
  State<ReleaseOnline> createState() => _ReleaseOnline();
}

class _ReleaseOnline extends State<ReleaseOnline> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Widget CardTitle(String string, String path, double size) {
      return Container(
          width: screenWidth * 0.8,
          height: 50,
          decoration: BoxDecoration(
              border: BorderDirectional(bottom: BorderSide(width: 1.0))),
          child: ListTile(
            leading: Image.asset(path),
            title: Text(
              string,
              style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
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
                                  'assets/images/personalcard.png'),
                              width: screenWidth,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(55.0),
                    ),
                    child:
                        Image(image: AssetImage('assets/images/avatar.png'))),
                20.width,
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            width: 185,
                            height: 35,
                            child: Text(
                              'はるこ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/google_plus.png'),
                                  width: 40,
                                )),
                            5.width,
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/pinterest.png'),
                                  width: 40,
                                )),
                            5.width,
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Image(
                                  image: AssetImage('assets/images/tiktok.png'),
                                  width: 40,
                                )),
                            5.width,
                            Container(
                                padding: const EdgeInsets.all(5),
                                child: Image(
                                  image:
                                      AssetImage('assets/images/instagram.png'),
                                  width: 40,
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '私は、はるこです。あいうえおかき \nくけこさしすせそたちつてと',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: screenWidth * 0.9,
                    height: 370,
                    child: Card(
                        elevation: 4,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            15.height,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CardTitle('株式会社　タナカ',
                                      'assets/images/r_address.png', 18)
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardTitle(
                                    'CEO', 'assets/images/r_message.png', 18)
                              ],
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardTitle('+12255551002',
                                    'assets/images/r_call.png', 18)
                              ],
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardTitle('090090122552',
                                    'assets/images/r_mobile.png', 18)
                              ],
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardTitle(
                                    'お問い合わせ', 'assets/images/r_mail.png', 18)
                              ],
                            ),
                            5.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CardTitle('https://www.facebook.com/haruko',
                                    'assets/images/r_location.png', 14)
                              ],
                            ),
                          ],
                        )))
              ],
            )
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
                                      Navigator.pop(context);
                                    },
                                    string: 'ビジネス',
                                  ),
                                  Cancelbutton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  BCardManagePage2()));
                                    },
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
