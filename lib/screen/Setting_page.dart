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
                          'ID',
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
                      'プロフィールURL',
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
                            ComTextField(
                              textheight: 40,
                              wordsize: 14,
                              textwidth: screenWidth * 0.8,
                              callback: (text) {},
                              hinttext: 'https://degime.net/3R3uLJ',
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
                    Container(
                        width: screenWidth * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ComTextField(
                              textheight: 40,
                              wordsize: 14,
                              textwidth: screenWidth * 0.8,
                              callback: (text) {},
                              hinttext: 'https://degime.net/3R3uLJ',
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
                    Container(
                        width: screenWidth * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ComTextField(
                              textheight: 40,
                              wordsize: 14,
                              textwidth: screenWidth * 0.8,
                              callback: (text) {},
                              hinttext: 'https://degime.net/3R3uLJ',
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
                      title: 'NFCに書き込み',
                      bordercolor: Colors.white,
                      width: 143,
                      height: 35,
                      fillcolor: Color(0xFF2AC3FF),
                      wordcolor: Colors.white,
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
                          '名前',
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
                          'アバター　\n※ここで一括して自分の写真を登録できます。',
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          height: 40,
                          width: screenWidth * 0.8,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: black),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            children: [
                              10.width,
                              FunctionButton(
                                title: 'Choose File',
                                wordsize: 12,
                                fillcolor: Color(0xFFE7E7E7),
                                wordcolor: Colors.black,
                                bordercolor: Colors.white,
                                width: 100,
                                height: 30,
                              ),
                              10.width,
                              Text(
                                'No file chosen',
                                style: TextStyle(fontSize: 14, color: grey),
                              )
                            ],
                          ),
                        ),
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
                10.height,
                Row(
                  children: [
                    Container(
                        width: screenWidth * 0.8,
                        child: Text(
                          "メールアドレスを変更する場合は、新しいメールアドレスに変更のうえ、「仮登録メールを送信」をクリックしてください。\n送信後24時間以内に、メールに記載されているURLをクリックしていただくと、メールアドレス変更が完了となります。",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ))
                  ],
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FunctionButton(
                      title: '仮登録メールを送信',
                      bordercolor: Colors.transparent,
                      width: 200,
                      height: 40,
                      fillcolor: Color(0xFFB0B0B0),
                      wordcolor: Colors.black,
                      wordsize: 16,
                      onPressed: () {
                        CircularProgressIndicator();
                      },
                    ),
                    40.width
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.8,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: 3.0, color: Color(0xFF4C31F4)))),
                      child: Text(
                        " メール配信状況",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                5.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FunctionButton(
                      title: '配信中',
                      wordsize: 12,
                      fillcolor: Color(0xFF0E9CFF),
                      wordcolor: Colors.white,
                      bordercolor: Colors.white,
                      width: 100,
                      height: 30,
                    ),
                    10.width,
                    FunctionButton(
                      title: '配信しない',
                      wordsize: 12,
                      fillcolor: Color(0xFFE7E7E7),
                      wordcolor: Color(0xFFB1B1B1),
                      bordercolor: Colors.white,
                      width: 100,
                      height: 30,
                    ),
                    40.width,
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.8,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: 3.0, color: Color(0xFF4C31F4)))),
                      child: Text(
                        " パスワードの変更",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                20.height,
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
                          '新しいパスワードを入力',
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
                          ' 新しいパスワードを再入力',
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
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    40.width
                  ],
                ),
                30.height,
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.8,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: 3.0, color: Color(0xFF4C31F4)))),
                      child: Text(
                        " ご意見・ご質問・お問い合わせはこちらから",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    )
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.8,
                      height: 30,
                      child: Text(
                        " アカウント名：haruko",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: screenWidth * 0.8,
                      height: 30,
                      child: Text(
                        " 返信先のメールアドレス：master@sinka.link",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
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
                          '件名',
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
                          ' 本文',
                          style: TextStyle(fontSize: 16),
                        ),
                        ComTextField(
                            textheight: 100,
                            maxline: 40,
                            textwidth: screenWidth * 0.8,
                            callback: (text) {},
                            hinttext: ''),
                      ],
                    )
                  ],
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FunctionButton(
                      title: '送信する',
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
                    40.width
                  ],
                ),
                10.height
              ],
            ),
          ),
        ));
  }
}
