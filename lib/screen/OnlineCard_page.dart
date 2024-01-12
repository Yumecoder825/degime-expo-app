import 'dart:ui';

import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/screen/ReleaseOnline_page.dart';
import 'package:degime_131/screen/SNSCard_page.dart';
import 'package:degime_131/utils/ComTextfield.dart';
import 'package:degime_131/utils/FunctionButton.dart';
import 'package:degime_131/utils/Reservation.dart';
import 'package:degime_131/utils/SelectButton.dart';
import 'package:degime_131/utils/UploadField.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:degime_131/utils/Cancelbutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class OnlineCard extends StatefulWidget {
  @override
  State<OnlineCard> createState() => _OnlineCard();
}

class _OnlineCard extends State<OnlineCard> {
  int space = 5;
  bool checked = false;
  PageController _pageController = PageController(initialPage: 0);
  double currentIndexPage = 0;
  final ImagePicker picker = ImagePicker();
  bool cancelclick = false;
  List<String> imageFiles = List.filled(19, "1");
  List<TextEditingController> _controllers =
      List.generate(54, (index) => TextEditingController()); //after 39
  List<Widget> widgetList1 = [];
  List<Map<String, Widget>> widgetList2 = [];
  Color selectedColor = Colors.black;
  Color cardcolor = Colors.white;
  Color imagecolor = Colors.white;
  List<String> _textValues = List<String>.filled(53, "");

  Widget AddLink() {
    return Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                child: imageFiles[2].contains('png')
                    ? Image.asset(imageFiles[2])
                    : Image.file(File(imageFiles[2])),
              ),
              Column(
                children: [
                  Text(
                    _textValues[0],
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    _textValues[1],
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
        ]));
  }

  Widget CardTextField(
      String index, TextEditingController _controller, Color wordcolor) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 50,
        child: Card(
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Container(
                width: 1,
              ),
              contentPadding: EdgeInsets.all(0),
              title: Container(
                  width: MediaQuery.of(context).size.width * 0.7 - 1,
                  height: 50,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          gapPadding: 10,
                        ),
                        hintText: index,
                        suffixIcon: IconButton(
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.black.withOpacity(0.5),
                          onPressed: () {
                            _controller.text = '';
                          },
                        ),
                        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    style: TextStyle(fontSize: 20, color: wordcolor),
                    textAlign: TextAlign.left,
                  )),
            )));
  }

  Widget AddOneScreen(
      String imagefile, String text1, String text2, double index) {
    return Container(
        height: 300,
        width: MediaQuery.of(context).size.width * (index),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.transparent,
                          contentPadding: EdgeInsets.all(0),
                          content: Container(
                            width: 400,
                            height: 400,
                            child: Image.file(
                              File(imagefile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * index,
                  height: 260,
                  child: Image.file(
                    File(imagefile),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Text(
                  text1,
                  //_textValues[3],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: Text(
                  text2,
                  //_textValues[3],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget AddTwoScreens() {
    return Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            AddOneScreen(imageFiles[4], _textValues[6], _textValues[7], 0.45),
            AddOneScreen(imageFiles[5], _textValues[9], _textValues[10], 0.45),
          ],
        ));
  }

  Widget AddThreeScreens(int index) {
    return CustomPage(
      dotscount: 3,
      pageInserts: [
        AddOneScreen(imageFiles[6], _textValues[12], _textValues[13], 0.9),
        AddOneScreen(imageFiles[7], _textValues[15], _textValues[16], 0.9),
        AddOneScreen(imageFiles[8], _textValues[18], _textValues[19], 0.9),
      ],
      currentPage: index.toDouble(),
    );
  }

  Widget AddFourScreens(int index) {
    return CustomPage(
      dotscount: 4,
      pageInserts: [
        AddOneScreen(imageFiles[9], _textValues[21], _textValues[22], 0.9),
        AddOneScreen(imageFiles[10], _textValues[24], _textValues[25], 0.9),
        AddOneScreen(imageFiles[11], _textValues[27], _textValues[28], 0.9),
        AddOneScreen(imageFiles[12], _textValues[30], _textValues[31], 0.9),
      ],
      currentPage: index.toDouble(),
    );
  }

  void _addTextValue(String text, int index) {
    setState(() {
      _textValues[index] = text;
    });
  }

  Future<void> pickImage(BuildContext context, int imageIndex) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFiles[imageIndex] = pickedFile.path;
      });
    }
  }

  void _showLinkAdd(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10),
          content: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ComTextField(
                                    controller: _controllers[index + 32],
                                    textheight: 35,
                                    textwidth: 180,
                                    callback: (text) =>
                                        _addTextValue(text, index + 32),
                                    hinttext: ''),
                                10.height,
                                ComTextField(
                                    controller: _controllers[index + 36],
                                    textheight: 35,
                                    textwidth: 180,
                                    callback: (text) =>
                                        _addTextValue(text, index + 36),
                                    hinttext: 'URL設定'),
                              ]),
                        )
                      ]),
                ],
              )),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
              icon: SvgPicture.asset('assets/images/preserve.svg'),
              iconSize: 50,
            ),
          ],
        );
      },
    );
  }

  void _showText(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10),
          content: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.9,
            height: 180,
            child: QuillEditorPage(),
          ),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete)),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/preserve.svg'),
              iconSize: 50,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Reservation();
                    });
              },
              icon: SvgPicture.asset('assets/images/reservation.svg'),
              iconSize: 50,
            ),
          ],
        );
      },
    );
  }

  void _showDegime(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10),
          content: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width * 0.9,
              height: 550,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 7),
                                child: Text(
                                  '公開されました！',
                                  style: TextStyle(
                                      color: Color(0xFF4C31F4),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                          ]),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Cancelbutton(
                            string: 'プレビュー',
                            color: Color(0xFF0E9CFF),
                            onPressed: () {},
                          )),
                        ],
                      ),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ComTextField(
                              controller: _controllers[39],
                              textheight: 25,
                              textwidth: 250,
                              callback: (text) => _addTextValue(text, 39),
                              hinttext: 'https://degime.net/gopty'),
                        ],
                      ),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset('assets/images/degime.png'),
                          )
                        ],
                      ),
                      90.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              child: Cancelbutton(
                            string: 'すぐ購入する',
                            color: Color(0xFFB6B6B9),
                            onPressed: () {},
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          MyCheckbox(
                            onChanged: (bool? value) {
                              checked = value!;
                            },
                          ),
                          Text(
                            '今後この画面を出さない',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                      top: 300,
                      left: 5,
                      child: Center(
                          child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Degimeカードにシフトしませんか？',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              '今までの名刺からデジタル名刺へ \n相手のスマホに近づけるだけで、あな\nたのプロフィールページを瞬時に表示\nすることができます',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF906579)),
                            ),
                          ),
                        ],
                      )))
                ],
              )),
        );
      },
    );
  }

  Widget _pageView(int index, int textorder) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 270,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UploadField(
                uploadheight: 140,
                uploadwidth: MediaQuery.of(context).size.width * 0.7,
                imageFile: imageFiles[index],
                onPress: () async {
                  await pickImage(context, index);
                  Navigator.of(context).pop();
                  if (index == 3) {
                    _showOneScreenAdd(context);
                  } else if (index == 4) {
                    _showTwoScreensAdd(context, 0);
                  } else if (index == 5) {
                    _showTwoScreensAdd(context, 1);
                  } else if (index == 6) {
                    _showThreeScreensAdd(context, 0);
                  } else if (index == 7) {
                    _showThreeScreensAdd(context, 1);
                  } else if (index == 8) {
                    _showThreeScreensAdd(context, 2);
                  } else if (index == 9) {
                    _showFourScreensAdd(context, 0);
                  } else if (index == 10) {
                    _showFourScreensAdd(context, 1);
                  } else if (index == 11) {
                    _showFourScreensAdd(context, 2);
                  } else if (index == 12) {
                    _showFourScreensAdd(context, 3);
                  }
                }),
            10.height,
            ComTextField(
                controller: _controllers[textorder],
                textheight: 35,
                textwidth: MediaQuery.of(context).size.width * 0.7,
                callback: (text) => _addTextValue(text, textorder),
                hinttext: 'タイトル'),
            5.height,
            ComTextField(
                controller: _controllers[textorder + 1],
                textheight: 35,
                textwidth: MediaQuery.of(context).size.width * 0.7,
                callback: (text) => _addTextValue(text, textorder + 1),
                hinttext: 'テキスト'),
            5.height,
            ComTextField(
                controller: _controllers[textorder + 2],
                textheight: 35,
                textwidth: MediaQuery.of(context).size.width * 0.7,
                callback: (text) => _addTextValue(text, textorder + 2),
                hinttext: 'URL'),
          ],
        ));
  }

  File? _pdfFile;

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _pdfFile = File(result.files.single.path!);
      });
    }
  }

  Widget PdfScreen(File filepath) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: Colors.black.withOpacity(0.3), width: 1.0),
                  ),
                  child: SfPdfViewer.file(filepath)),
              10.height,
              Container(
                alignment: Alignment.topCenter,
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [Color(0xFFFF7D54), Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'ダウンロード',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ]));
  }

  void _showMaporMovie(BuildContext context, String url, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          content: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 310,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.3), width: 1.0),
                      ),
                      child: _pdfFile != null
                          ? SfPdfViewer.file(_pdfFile!)
                          : IconButton(
                              icon:
                                  SvgPicture.asset('assets/images/upload.svg'),
                              onPressed: () async {
                                await _pickPDF();
                                Navigator.of(context).pop();
                                _showMaporMovie(context, url, index);
                              })),
                  10.height,
                  ComTextField(
                      controller: _controllers[index],
                      textheight: 35,
                      textwidth: MediaQuery.of(context).size.width * 0.7,
                      callback: (text) => _addTextValue(text, index),
                      hinttext: url),
                ],
              )),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            index == 35
                ? Container(
                    padding: EdgeInsets.all(0),
                    child: Row(
                      children: [
                        MyCheckbox(
                          onChanged: (bool? value) {
                            checked = value!;
                          },
                        ),
                        Text('ダウンロードを許可する')
                      ],
                    ),
                  )
                : Container(
                    height: 0,
                    width: 0,
                  ),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.delete)),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (index == 35 && checked == true) {
                          Navigator.of(context).pop();
                          widgetList1.add(PdfScreen(_pdfFile!));
                        }
                      });
                    },
                    icon: SvgPicture.asset('assets/images/preserve.svg'),
                    iconSize: 50,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/reservation.svg'),
                    iconSize: 50,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          content: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectButton(
                        title: '資格',
                        width: 45,
                        backgroundColor: const Color(0xFFFF8F61),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '資格';
                          });
                        },
                      ),
                      SelectButton(
                        title: '特技',
                        width: 45,
                        backgroundColor: const Color(0xFFFF8F61),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '特技';
                          });
                        },
                      ),
                      SelectButton(
                        title: '経歴',
                        width: 45,
                        backgroundColor: const Color(0xFFFF8F61),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '経歴';
                          });
                        },
                      ),
                      SelectButton(
                        title: '事業の強み',
                        width: 120,
                        backgroundColor: const Color(0xFFFF8F61),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '事業の強み';
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectButton(
                        title: '提供できるリソース',
                        width: 140,
                        backgroundColor: const Color(0xFFFF8F61),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '提供できるリソース';
                          });
                        },
                      ),
                      SelectButton(
                        title: 'イノベーション実績',
                        width: 140,
                        backgroundColor: const Color(0xFFFF8F61),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = 'イノベーション実績';
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectButton(
                        title: 'お知らせ',
                        width: 80,
                        backgroundColor: const Color(0xFFDA8D45),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = 'お知らせ';
                          });
                        },
                      ),
                      SelectButton(
                        title: 'メッセージ',
                        width: 80,
                        backgroundColor: const Color(0xFFDA8D45),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = 'メッセージ';
                          });
                        },
                      ),
                      SelectButton(
                        title: 'アイデア募集中',
                        width: 120,
                        backgroundColor: const Color(0xFF9747FF),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = 'アイデア募集中';
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectButton(
                        title: 'こんな企業と出会いたい',
                        width: 160,
                        backgroundColor: const Color(0xFF9747FF),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = 'こんな企業と出会いたい';
                          });
                        },
                      ),
                      SelectButton(
                        title: '抱えている問題',
                        width: 130,
                        backgroundColor: const Color(0xFF4F4F4F),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '抱えている問題';
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SelectButton(
                        title: '実現したいことや目標',
                        width: 160,
                        backgroundColor: const Color(0xFF9747FF),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '実現したいことや目標';
                          });
                        },
                      ),
                      SelectButton(
                        title: '苦手なこと',
                        width: 120,
                        backgroundColor: const Color(0xFF4F4F4F),
                        onPressed: () {
                          setState(() {
                            _controllers[37].text = '苦手なこと';
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ComTextField(
                          controller: _controllers[37],
                          textheight: 30,
                          textwidth:
                              MediaQuery.of(context).size.width * 0.8 - 22,
                          callback: (text) => _addTextValue(text, 37),
                          hinttext: 'タイトル入力'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ComTextField(
                          controller: _controllers[38],
                          textheight: 30,
                          textwidth:
                              MediaQuery.of(context).size.width * 0.8 - 22,
                          callback: (text) => _addTextValue(text, 38),
                          hinttext: 'テキスト入力'),
                    ],
                  ),
                ],
              )),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete)),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/preserve.svg'),
              iconSize: 50,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/reservation.svg'),
              iconSize: 50,
            ),
          ],
        );
      },
    );
  }

  void _setSpace(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          content: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(0),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '余白サイズを指定してください',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                20.height,
                Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 35,
                    child: TextField(
                      controller: _controllers[36],
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            gapPadding: 10,
                          ),
                          hintText: '5mm幅',
                          prefixIcon: IconButton(
                            icon: Icon(Icons.arrow_upward_outlined),
                            onPressed: () {
                              setState(() {
                                if (space < 20) space++;
                                _controllers[36].text = '${space}mm幅';
                              });
                            },
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.arrow_downward_outlined),
                            onPressed: () {
                              setState(() {
                                if (space > 5) space--;
                                _controllers[36].text = '${space}mm幅';
                              });
                            },
                          ),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.delete)),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('assets/images/preserve.svg'),
                    iconSize: 50,
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void _downLoadSlide(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            content: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.black.withOpacity(0.3), width: 1.0),
                        ),
                        child: IconButton(
                            icon: SvgPicture.asset('assets/images/upload.svg'),
                            onPressed: () {}),
                      ),
                    ),
                  ],
                )),
            actionsPadding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            actions: [
              Center(
                  child: Container(
                alignment: Alignment.topCenter,
                width: 150,
                height: 35,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF8F61),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    'ダウンロード',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
            ],
          );
        });
  }

  void _showOneScreenAdd(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          content: _pageView(3, 3),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete)),
            IconButton(
              onPressed: () {
                setState(() {
                  widgetList1.add(AddOneScreen(
                      imageFiles[3], _textValues[3], _textValues[4], 0.9));
                  widgetList2.add({
                    "one": AddOneScreen(
                        imageFiles[3], _textValues[3], _textValues[4], 0.9)
                  });
                  widgetList2[0]["one"];
                  Navigator.of(context).pop();
                });
              },
              icon: SvgPicture.asset('assets/images/preserve.svg'),
              iconSize: 50,
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/reservation.svg'),
              iconSize: 50,
            ),
          ],
        );
      },
    );
  }

  void _showTwoScreensAdd(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            dotscount: 2,
            pageInserts: [_pageView(4, 6), _pageView(5, 9)],
            // pageInsert1: _pageView(4, 6),
            // pageInsert2: _pageView(5, 9),
            onPress: () {
              setState(() {
                widgetList1.add(AddTwoScreens());
                Navigator.of(context).pop();
              });
            },
            currentPage: index.toDouble(),
            //   Navigator.of(context).pop()
            // },
          );
        });
  }

  void _showThreeScreensAdd(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            dotscount: 3,
            pageInserts: [_pageView(6, 12), _pageView(7, 15), _pageView(8, 18)],
            // pageInsert1: _pageView(4, 6),
            // pageInsert2: _pageView(5, 9),
            onPress: () {
              setState(() {
                widgetList1.add(AddThreeScreens(0));
                Navigator.of(context).pop();
              });
            },
            currentPage: index.toDouble(),
            //   Navigator.of(context).pop()
            // },
          );
        });
  }

  void _showFourScreensAdd(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            dotscount: 4,
            pageInserts: [
              _pageView(9, 21),
              _pageView(10, 24),
              _pageView(11, 27),
              _pageView(12, 30)
            ],
            // pageInsert1: _pageView(4, 6),
            // pageInsert2: _pageView(5, 9),
            onPress: () {
              setState(() {
                widgetList1.add(AddFourScreens(0));
                Navigator.of(context).pop();
              });
            },
            currentPage: index.toDouble(),
            //   Navigator.of(context).pop()
            // },
          );
        });
  }

  void ShowIcons(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(top: 10),
            content: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.9,
                height: 160,
                child: Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          40.height,
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon:
                                      Image.asset('assets/images/youtube.png'),
                                  iconSize: 40,
                                  onPressed: () {
                                    imageFiles[index] =
                                        'assets/images/youtube.png';
                                    Navigator.of(context).pop();
                                    _controllers[index + 32].text = 'Youtube';
                                    _addTextValue('Youtube', index + 32);
                                    _showLinkAdd(context, index);
                                  },
                                ),
                                IconButton(
                                  icon: Image.asset(
                                      'assets/images/instagram.png'),
                                  iconSize: 40,
                                  onPressed: () {
                                    imageFiles[index] =
                                        'assets/images/instagram.png';
                                    Navigator.of(context).pop();
                                    _controllers[index + 32].text = 'Instagram';
                                    _addTextValue('Instagram', index + 32);
                                    _showLinkAdd(context, index);
                                  },
                                ),
                                IconButton(
                                  icon: Image.asset('assets/images/tiktok.png'),
                                  iconSize: 40,
                                  onPressed: () {
                                    imageFiles[index] =
                                        'assets/images/tiktok.png';
                                    Navigator.of(context).pop();
                                    _controllers[index + 32].text = 'TikTok';
                                    _addTextValue('TikTok', index + 32);
                                    _showLinkAdd(context, index);
                                  },
                                ),
                                IconButton(
                                  icon: Image.asset(
                                      'assets/images/pinterest.png'),
                                  iconSize: 40,
                                  onPressed: () {
                                    imageFiles[index] =
                                        'assets/images/pinterest.png';
                                    Navigator.of(context).pop();
                                    _controllers[index + 32].text = 'Pinterest';
                                    _addTextValue('Pinterest', index + 32);
                                    _showLinkAdd(context, index);
                                  },
                                ),
                                IconButton(
                                  icon:
                                      Image.asset('assets/images/linkedin.png'),
                                  iconSize: 40,
                                  onPressed: () {
                                    imageFiles[index] =
                                        'assets/images/linkedin.png';
                                    Navigator.of(context).pop();
                                    _controllers[index + 32].text = 'LinkedIn';
                                    _addTextValue('LinkedIn', index + 32);
                                    _showLinkAdd(context, index);
                                  },
                                ),
                              ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Image.asset('assets/images/facebook.png'),
                                iconSize: 40,
                                onPressed: () {
                                  imageFiles[index] =
                                      'assets/images/facebook.png';
                                  Navigator.of(context).pop();
                                  _controllers[index + 32].text = 'Facebook';
                                  _addTextValue('Facebook', index + 32);
                                  _showLinkAdd(context, index);
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                    'assets/images/google_plus.png'),
                                iconSize: 40,
                                onPressed: () {
                                  imageFiles[index] =
                                      'assets/images/google_plus.png';
                                  Navigator.of(context).pop();
                                  _controllers[index + 32].text = 'Google+';
                                  _addTextValue('Google+', index + 32);
                                  _showLinkAdd(context, index);
                                },
                              ),
                              IconButton(
                                icon: Image.asset('assets/images/line.png'),
                                iconSize: 40,
                                onPressed: () {
                                  imageFiles[index] = 'assets/images/line.png';
                                  Navigator.of(context).pop();
                                  _controllers[index + 32].text = 'Line';
                                  _addTextValue('Line', index + 32);
                                  _showLinkAdd(context, index);
                                },
                              ),
                              IconButton(
                                icon: Image.asset('assets/images/mail.png'),
                                iconSize: 40,
                                onPressed: () {
                                  imageFiles[index] = 'assets/images/mail.png';
                                  Navigator.of(context).pop();
                                  _controllers[index + 32].text = 'Mail';
                                  _addTextValue('Mail', index + 32);
                                  _showLinkAdd(context, index);
                                },
                              ),
                              IconButton(
                                icon: Image.asset('assets/images/twitter.png'),
                                iconSize: 40,
                                onPressed: () {
                                  imageFiles[index] =
                                      'assets/images/twitter.png';
                                  Navigator.of(context).pop();
                                  _controllers[index + 32].text = 'Twitter';
                                  _addTextValue('Twitter', index + 32);
                                  _showLinkAdd(context, index);
                                },
                              ),
                            ],
                          ),
                        ]),
                    Positioned(
                        top: -15,
                        right: 5,
                        child: IconButton(
                          icon: Icon(Icons.cancel_rounded),
                          iconSize: 20,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                    Positioned(
                        top: -15,
                        left: 5,
                        child: IconButton(
                          icon: Icon(Icons.add),
                          iconSize: 40,
                          onPressed: () async {
                            await pickImage(context, index);
                            Navigator.of(context).pop();
                            _showLinkAdd(context, index);
                          },
                        ))
                  ],
                )),
          );
        });
  }

  void ShowBack(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(10),
            content: Container(
              height: 400,
              child: ColorPicker(
                color: index == 17 ? imagecolor : cardcolor,
                onColorChanged: (Color color) {
                  setState(() {
                    index == 17 ? imagecolor = color : cardcolor = color;
                  });
                },
                showColorCode: true,
                borderRadius: 8,
              ),
            ),
            actions: [
              Row(
                children: [
                  Text(
                    '画像をアップロードします',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: imageFiles[index] != "1"
                        ? GestureDetector(
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  FileImage(File(imageFiles[index])),
                            ),
                            onTap: () async {
                              await pickImage(context, index);
                              Navigator.of(context).pop();
                              ShowBack(index);
                            },
                          )
                        : IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 25,
                            ),
                            color: Colors.black.withOpacity(0.3),
                            onPressed: () async {
                              await pickImage(context, index);
                              Navigator.of(context).pop();
                              ShowBack(index);
                            }),
                  ),
                  imageFiles[index] != "1"
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              imageFiles[index] = "1";
                              Navigator.of(context).pop();
                              ShowBack(index);
                            });
                          },
                          icon: Icon(Icons.cancel))
                      : 5.width
                ],
              )
            ],
          );
        });
  }

  int selectedIndex = -1;
  late List<Widget> listtiles = [
    CardTextField('会社名', _controllers[2], selectedColor),
    CardTextField('役職', _controllers[40], selectedColor),
    CardTextField('会社URL', _controllers[53], selectedColor),
    CardTextField('会社電話', _controllers[41], selectedColor),
    CardTextField('携帯電話', _controllers[42], selectedColor),
    CardTextField('メールアドレス', _controllers[43], selectedColor),
    CardTextField('住所', _controllers[44], selectedColor),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: screenWidth,
            leading: Container(
              height: 38,
              alignment: Alignment.bottomLeft,
              width: screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LandingPage()));
                        },
                        iconSize: 40,
                        icon: SvgPicture.asset(
                          'assets/images/return.svg',
                          color: const Color(0xFF9747FF),
                        )),
                    IconButton(
                        onPressed: () {
                          _showDegime(context);
                        },
                        iconSize: 80,
                        icon: SvgPicture.asset(
                          'assets/images/public.svg',
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ReleaseOnline()));
                        },
                        iconSize: 80,
                        icon: SvgPicture.asset(
                          'assets/images/private.svg',
                        )),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SNSCard()));
                        },
                        iconSize: 100,
                        icon: SvgPicture.asset(
                          'assets/images/sns.svg',
                        )),
                  ]),
            )),
        body: Container(
          decoration: imageFiles[17] != "1"
              ? BoxDecoration(
                  image: DecorationImage(
                  image: FileImage(File(imageFiles[17])),
                  fit: BoxFit.cover,
                ))
              : BoxDecoration(
                  color: imagecolor,
                ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth,
                        height: 38,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  ShowBack(17);
                                },
                                iconSize: 40,
                                icon: SvgPicture.asset(
                                  'assets/images/backsetting.svg',
                                )),
                            IconButton(
                                onPressed: () {},
                                iconSize: 40,
                                icon: SvgPicture.asset(
                                  'assets/images/setting2.svg',
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: screenWidth * 0.8,
                                height: screenHeight * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: const Color(0xFF2A08F8),
                                        width: 3.0)),
                                child: imageFiles[1] != "1"
                                    ? Image.file(
                                        File(imageFiles[1]),
                                        fit: BoxFit.fill,
                                      )
                                    : null,
                              ),
                            ],
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                  icon: SvgPicture.asset(
                                      'assets/images/note.svg'),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            content: Container(
                                              height: 100,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FunctionButton(
                                                    title: 'カメラで名刺を撮影する',
                                                    fillcolor: Color(
                                                      0xFF2AC3FF,
                                                    ),
                                                    wordcolor: Colors.white,
                                                    onPressed: () {},
                                                  ),
                                                  FunctionButton(
                                                    title: '名刺・画像をアップロードする',
                                                    fillcolor: Color(
                                                      0xFFFF8F61,
                                                    ),
                                                    wordcolor: Colors.white,
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                      pickImage(context, 1);
                                                      print(imageFiles[1]);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }))
                        ],
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: imageFiles[0] != "1"
                            ? GestureDetector(
                                child: CircleAvatar(
                                  radius: 55,
                                  backgroundImage:
                                      FileImage(File(imageFiles[0])),
                                ),
                                onTap: () {
                                  pickImage(context, 0);
                                },
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 25,
                                ),
                                color: Colors.black.withOpacity(0.3),
                                onPressed: () {
                                  pickImage(context, 0);
                                }),
                      ),
                      20.width,
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(children: [
                                ComTextField(
                                  textheight: 35,
                                  textwidth: 185,
                                  callback: (text) {},
                                  hinttext: '氏名',
                                  controller: _controllers[39],
                                ),
                              ]),
                              10.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      child: UploadField(
                                        uploadheight: 40,
                                        uploadwidth: 40,
                                        imageFile: imageFiles[13],
                                        onPress: () {
                                          ShowIcons(context, 13);
                                        },
                                      )),
                                  5.width,
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      child: UploadField(
                                        uploadheight: 40,
                                        uploadwidth: 40,
                                        imageFile: imageFiles[14],
                                        onPress: () {
                                          ShowIcons(context, 14);
                                        },
                                      )),
                                  5.width,
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      child: UploadField(
                                        uploadheight: 40,
                                        uploadwidth: 40,
                                        imageFile: imageFiles[15],
                                        onPress: () {
                                          ShowIcons(context, 15);
                                        },
                                      )),
                                  5.width,
                                  Container(
                                      padding: const EdgeInsets.all(5),
                                      child: UploadField(
                                        uploadheight: 40,
                                        uploadwidth: 40,
                                        imageFile: imageFiles[16],
                                        onPress: () {
                                          ShowIcons(context, 16);
                                        },
                                      )),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: screenWidth * 0.9,
                          height: 470,
                          child: Card(
                              elevation: 4,
                              color: cardcolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                  decoration: imageFiles[18] != "1"
                                      ? BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                            image:
                                                FileImage(File(imageFiles[18])),
                                            fit: BoxFit.cover,
                                          ))
                                      : BoxDecoration(),
                                  child: Column(
                                    children: [
                                      15.height,
                                      Row(children: [
                                        Container(
                                          width: screenWidth * 0.8,
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          content: Container(
                                                            height: 400,
                                                            child: ColorPicker(
                                                              color:
                                                                  selectedColor,
                                                              onColorChanged:
                                                                  (Color
                                                                      color) {
                                                                setState(() {
                                                                  selectedColor =
                                                                      color;
                                                                });
                                                              },
                                                              showColorCode:
                                                                  true,
                                                              borderRadius: 8,
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                icon: SvgPicture.asset(
                                                  'assets/images/wordcolor.svg',
                                                ),
                                                iconSize: 50,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  ShowBack(18);
                                                },
                                                icon: SvgPicture.asset(
                                                    'assets/images/backsettingr.svg'),
                                                iconSize: 50,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                      Container(
                                          width: screenWidth * 0.8,
                                          height: 400,
                                          child: ListView.builder(
                                            itemCount: listtiles.length,
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 0),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return LongPressDraggable<int>(
                                                data: index,
                                                child: DragTarget<int>(
                                                  onWillAccept: (data) => true,
                                                  onAccept: (data) {
                                                    setState(() {
                                                      final draggedElement =
                                                          listtiles[data];
                                                      listtiles.removeAt(data);
                                                      listtiles.insert(index,
                                                          draggedElement);
                                                    });
                                                  },
                                                  builder: (context,
                                                      candidateData,
                                                      rejectedData) {
                                                    return listtiles[index];
                                                  },
                                                ),
                                                feedback: listtiles[index],
                                                childWhenDragging: Container(),
                                              );
                                            },
                                          ))
                                    ],
                                  ))))
                    ],
                  ),
                  5.height,
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(
                      children: [
                        Container(
                          width: screenWidth * 0.9,
                          height: widgetList1.length == 0
                              ? 0
                              : 300 * widgetList1.length.toDouble(),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widgetList1.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    widgetList1[index],
                                    Positioned(
                                        top: 0,
                                        right: 10,
                                        child: IconButton(
                                          icon: Icon(Icons.cancel_outlined),
                                          onPressed: () {
                                            setState(() {
                                              widgetList1.removeAt(index);
                                            });
                                          },
                                        ))
                                  ],
                                );
                              }),
                        ),
                      ],
                    )
                  ]),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '1面画像リンク追加',
                        onPressed: () {
                          _showOneScreenAdd(context);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '２面画像リンク追加',
                        onPressed: () {
                          setState(() {
                            for (int i = 6; i < 12; i++) {
                              _controllers[i].clear();
                            }
                          });
                          _showTwoScreensAdd(context, 0);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '３面画像リンク追加',
                        onPressed: () {
                          setState(() {
                            for (int i = 12; i < 21; i++) {
                              _controllers[i].clear();
                            }
                          });
                          _showThreeScreensAdd(context, 0);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '４面画像リンク追加',
                        onPressed: () {
                          setState(() {
                            for (int i = 21; i < 33; i++) {
                              _controllers[i].clear();
                            }
                          });
                          _showFourScreensAdd(context, 0);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '動画リンク追加',
                        onPressed: () {
                          _showMaporMovie(context, 'Youtube Url', 33);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: 'テキスト追加',
                        onPressed: () {
                          _showText(context);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: 'マップ追加',
                        onPressed: () {
                          _showMaporMovie(context, 'Google Map Url', 34);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '余白追加',
                        onPressed: () {
                          _setSpace(context);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: '自己プロファイル追加',
                        onPressed: () {
                          _showProfile(context);
                        },
                      )
                    ],
                  ),
                  5.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FunctionButton(
                        title: 'スライド画像追加',
                        onPressed: () {
                          _showMaporMovie(context, 'URL', 35);
                        },
                      )
                    ],
                  ),
                  20.height
                ],
              ),
            ),
          ),
        ));
  }
}

class CustomDialog extends StatefulWidget {
  CustomDialog(
      {this.onPress,
      this.currentPage,
      this.dotscount,
      this.pageInserts,
      this.pageInsert2,
      this.pageInsert3,
      this.pageInsert4,
      super.key});
  List<Widget>? pageInserts;
  Widget? pageInsert2;
  Widget? pageInsert3;
  Widget? pageInsert4;
  double? currentPage;
  int? dotscount;
  final Function()? onPress;
  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentPage!.toInt());
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      content: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 330,
          child: Column(children: [
            Container(
                height: 300,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      widget.currentPage = value.toDouble();
                    });
                  },
                  children: [
                    for (int i = 0; i < widget.dotscount!; i++)
                      Container(
                        child: widget.pageInserts![i],
                      )
                  ],
                )),
            5.height,
            DotsIndicator(
              dotsCount: widget.dotscount!,
              position: widget.currentPage!.toInt(),
              decorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          ])),
      actionsPadding: EdgeInsets.all(0),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.delete)),
        IconButton(
          onPressed: widget.onPress,
          icon: SvgPicture.asset('assets/images/preserve.svg'),
          iconSize: 50,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/images/reservation.svg'),
          iconSize: 50,
        ),
      ],
    );
  }

  Widget buildPageContent(String content) {
    return Center(
      child: Text(
        content,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class MyCheckbox extends StatefulWidget {
  ValueChanged<bool>? onChanged;
  MyCheckbox({super.key, this.onChanged});
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value!;
        });
        widget.onChanged!(value!); // Call the callback function
      },
    );
  }
}

class QuillEditorPage extends StatefulWidget {
  const QuillEditorPage({super.key});
  @override
  State<QuillEditorPage> createState() => _QuillEditorPageState();
}

class _QuillEditorPageState extends State<QuillEditorPage> {
  final QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    return QuillProvider(
      configurations: QuillConfigurations(controller: _controller),
      child: Column(
        children: [
          const QuillToolbar(
            configurations: QuillToolbarConfigurations(
              showDividers: false,
              showFontFamily: true,
              showFontSize: true,
              showBoldButton: true,
              showItalicButton: true,
              showSmallButton: false,
              showUnderLineButton: true,
              showStrikeThrough: false,
              showInlineCode: false,
              showColorButton: true,
              showBackgroundColorButton: true,
              showClearFormat: true,
              showAlignmentButtons: true,
              showLeftAlignment: true,
              showCenterAlignment: true,
              showRightAlignment: true,
              showJustifyAlignment: true,
              showHeaderStyle: false,
              showListNumbers: false,
              showListBullets: false,
              showListCheck: false,
              showCodeBlock: false,
              showQuote: false,
              showIndent: false,
              showLink: false,
              showUndo: false,
              showRedo: false,
              showDirection: false,
              showSearchButton: false,
              showSubscript: false,
              showSuperscript: false,
            ),
          ),
          Expanded(
            child: QuillEditor(
              focusNode: FocusNode(),
              scrollController: ScrollController(
                  initialScrollOffset: 0, keepScrollOffset: false),
              configurations: QuillEditorConfigurations(
                  padding: EdgeInsets.all(5), readOnly: false),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPage extends StatefulWidget {
  CustomPage(
      {this.onPress,
      this.currentPage,
      this.dotscount,
      this.pageInserts,
      this.pageInsert2,
      this.pageInsert3,
      this.pageInsert4,
      super.key});
  List<Widget>? pageInserts;
  Widget? pageInsert2;
  Widget? pageInsert3;
  Widget? pageInsert4;
  double? currentPage;
  int? dotscount;
  final Function()? onPress;
  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.currentPage!.toInt());
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 300,
        child: Stack(children: [
          Container(
              height: 200,
              child: PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    widget.currentPage = value.toDouble();
                  });
                },
                children: [
                  for (int i = 0; i < widget.dotscount!; i++)
                    Container(
                      child: widget.pageInserts![i],
                    )
                ],
              )),
          Positioned(
            top: 0,
            right: MediaQuery.of(context).size.width * 0.3,
            child: DotsIndicator(
              dotsCount: widget.dotscount!,
              position: widget.currentPage!.toInt(),
              decorator: DotsDecorator(
                activeColor: Colors.white,
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
          )
        ]));
  }
}
