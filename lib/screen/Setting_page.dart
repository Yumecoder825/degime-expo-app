import 'package:degime_131/utils/ComTextfield.dart';
import 'package:degime_131/utils/FunctionButton.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';

class SettingPage extends StatefulWidget {
  @override
  State<SettingPage> createState() => _SettingPage();
}

class _SettingPage extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '設定',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(screenWidth * 0.1, 40, 0, 0),
            width: screenWidth,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ユーザーID',
                          style: TextStyle(fontSize: 16),
                        ),
                        5.height,
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: 'Superstar'),
                      ],
                    )
                  ],
                ),
                20.height,
                Row(
                  children: [
                    Text(
                      'ビジネス向けプロフィールページURL',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                5.height,
                Row(
                  children: [
                    Container(
                        width: screenWidth * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'https://degime.net/',
                              style: TextStyle(fontSize: 16),
                            ),
                            ComTextField(
                              textheight: 40,
                              wordsize: 14,
                              textwidth: screenWidth * 0.4,
                              callback: (text) {},
                              hinttext: 'Superstar',
                              suffix: FunctionButton(
                                title: '編集',
                                wordsize: 12,
                                fillcolor: Color(0xFF7A54FF),
                                wordcolor: Colors.white,
                                bordercolor: Colors.white,
                                width: 56,
                                height: 30,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Text(
                      'SNSリンクツリー向けプロフィールページURL',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                5.height,
                Row(
                  children: [
                    Container(
                        width: screenWidth * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'https://degime.net/',
                              style: TextStyle(fontSize: 16),
                            ),
                            ComTextField(
                              textheight: 40,
                              wordsize: 14,
                              textwidth: screenWidth * 0.4,
                              callback: (text) {},
                              hinttext: 'Superstar',
                              suffix: FunctionButton(
                                title: '編集',
                                wordsize: 12,
                                fillcolor: Color(0xFF7A54FF),
                                wordcolor: Colors.white,
                                bordercolor: Colors.white,
                                width: 56,
                                height: 30,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                20.height,
                Row(
                  children: [
                    FunctionButton(
                      title: 'Degimeカードに書き込む',
                      bordercolor: Colors.white,
                      width: 215,
                      height: 35,
                      fillcolor: Color(0xFF2AC3FF),
                      wordcolor: Colors.white,
                      wordsize: 16,
                      onPressed: () {},
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'カードを購入',
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF4C31F4)),
                        ))
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '氏名',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: 'haruko'),
                      ],
                    )
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ユーザー名',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: 'はるこ'),
                      ],
                    )
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'メールアドレス',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: 'master@sinka.link'),
                      ],
                    )
                  ],
                ),
                40.height,
                Row(
                  children: [
                    FunctionButton(
                      title: '更新',
                      bordercolor: Colors.white,
                      width: 65,
                      height: 40,
                      fillcolor: Color(0xFFB0B0B0),
                      wordcolor: Colors.black,
                      wordsize: 16,
                      onPressed: () {},
                    ),
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '変更したい現在使用中のパスワード入力',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: ''),
                      ],
                    )
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '現在使用中のパスワードを再入力',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: ''),
                      ],
                    )
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' 新しいパスワード入力',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: ''),
                      ],
                    )
                  ],
                ),
                10.height,
                Row(
                  children: [
                    FunctionButton(
                      title: 'パスワード変更',
                      bordercolor: Colors.transparent,
                      width: 145,
                      height: 40,
                      fillcolor: Color(0xFFB0B0B0),
                      wordcolor: Colors.black,
                      wordsize: 16,
                      onPressed: () {
                        CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
