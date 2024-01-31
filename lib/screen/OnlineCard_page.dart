import 'dart:ui';
import 'dart:convert';
import 'package:video_player/video_player.dart';
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
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:degime_131/utils/Cancelbutton.dart';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:degime_131/main.dart';
import 'package:degime_131/utils/Global_variable.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:nfc_manager/nfc_manager.dart';

class CardTextField extends StatelessWidget {
  final String index;
  final TextEditingController _controller;
  final Color wordcolor;
  CardTextField(this.index, this._controller, this.wordcolor);
  Widget build(BuildContext context) {
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
                  width: MediaQuery.of(context).size.width * 0.7 - 1.0,
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
                    style: TextStyle(fontSize: 14, color: wordcolor),
                    textAlign: TextAlign.left,
                  )),
            )));
  }
}

class OnlineCard extends StatefulWidget {
  File? imagefile;
  OnlineCard({super.key, this.imagefile});
  @override
  State<OnlineCard> createState() => _OnlineCard();
}

class _OnlineCard extends State<OnlineCard> {
  bool _isNfcAvailable = false;
  int currentpage = 0;
  Color _color = Color(0xFF96DA45);
  double _width = 140;
  String recognizedText = '';
  late String encoded = '';
  late String video = '';
  int space = 5;
  int orderindex = -1;
  bool checked = false;
  PageController _pageController = PageController(initialPage: 0);
  PageController _pageController1 =
      PageController(initialPage: 0, viewportFraction: 0.9);
  double currentIndexPage = 0;
  final ImagePicker picker = ImagePicker();
  bool cancelclick = false;
  List<String> imageFiles = List.filled(21, "1");
  // List<String> imageUrls = List.filled(21, "");
  List<TextEditingController> _controllers =
      List.generate(57, (index) => TextEditingController(text: "")); //after 39
  TextEditingController degimecontroller =
      TextEditingController(text: "https://degime.net/");
  List<Widget> widgetList1 = [];
  late Color selectedColor = Colors.black;
  Color cardcolor = Colors.white;
  Color imagecolor = Colors.white;
  List<String> _textValues = List<String>.filled(57, "");
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  String mapurl = 'https://maps.google.com/maps?q=37.7749,-122.4194';
  WebViewController _webcontroller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(
        Uri.parse('https://maps.google.com/maps?q=37.7749,-122.4194'));

  late WebViewController _webcontroller1 = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..loadRequest(Uri.parse(mapurl));

  double lines = 0;
  QuillController _quillcontroller1 = QuillController.basic();
  File? _pdfFile;
  String videoUrl = '';
  String pdfUrl = '';
  var info = [];
  var imageLink1 = [];
  var imageLink2 = [];
  var imageLink3 = [];
  var imageLink4 = [];
  var videoLink = [];
  var textLink = [];
  var mapLink = [];
  var profileLink = [];
  var pdfLink = [];
  var spaceAdd = [];

  Future<void> publicCard() async {
    var uri = Uri.parse('http://194.87.199.12:5000/social/private/online');
    var data = {
      'bgColor': imagecolor.toString(),
      'bgURL': GlobalVariables.imageUrls[17],
      'cardColor': cardcolor.toString(),
      'cardURL': GlobalVariables.imageUrls[18],
      'wordColor': selectedColor.toString(),
      'url_name': degimecontroller.text.splitAfter('net/'),
      'faceImg': GlobalVariables.imageUrls[0],
      'realName': _controllers[39].text,
      'company_url': _controllers[53].text,
      'companyName': _controllers[2].text,
      'position': _controllers[40].text,
      'phoneNumber': _controllers[41].text,
      'mobilePhoneNumber': _controllers[42].text,
      'mailAddress': _controllers[43].text,
      'address': _controllers[44].text,
      'idCard': {
        'idCard': GlobalVariables.idCard,
      },
      'socialLink': {
        'socialLink': [
          {
            'title': _controllers[45].text,
            "icon_link": GlobalVariables.imageUrls[13] == ""
                ? '/image/${_controllers[45].text.toLowerCase()}.png'
                : GlobalVariables.imageUrls1[13],
            "social_link": _controllers[49].text
          },
          {
            'title': _controllers[46].text,
            "icon_link": GlobalVariables.imageUrls[14] == ""
                ? '/image/${_controllers[46].text.toLowerCase()}.png'
                : GlobalVariables.imageUrls1[14],
            "social_link": _controllers[50].text
          },
          {
            'title': _controllers[47].text,
            "icon_link": GlobalVariables.imageUrls[15] == ""
                ? '/image/${_controllers[47].text.toLowerCase()}.png'
                : GlobalVariables.imageUrls1[15],
            "social_link": _controllers[51].text
          },
          {
            'title': _controllers[48].text,
            "icon_link": GlobalVariables.imageUrls[16] == ""
                ? '/image/${_controllers[48].text.toLowerCase()}.png'
                : GlobalVariables.imageUrls1[16],
            "social_link": _controllers[52].text
          },
        ]
      },
      'onlineCard_Data': {
        'imgLink1': imageLink1,
        'imgLink2': imageLink2,
        'imgLink3': imageLink3,
        'imgLink4': imageLink4,
        'videoLink': videoLink,
        'textLink': textLink,
        'mapLink': mapLink,
        'selfProfile': profileLink,
        'slideLink': pdfLink,
        'spaceAdd': spaceAdd
      }
    };
    final requestbody = jsonEncode(data);
    var response = await http.put(uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'token ${GlobalVariables.token}'
        },
        body: requestbody);
    //print(GlobalVariables.token);
    print(json.decode(response.body));
  }

  Future<void> _recognizeText(File processedImage) async {
    int index = 0;
    final inputImage = InputImage.fromFile(processedImage);
    final textRecognizer = GoogleMlKit.vision
        .textRecognizer(script: TextRecognitionScript.japanese);
    final recognisedText = await textRecognizer.processImage(inputImage);
    String recognizedText = recognisedText.text;
    setState(() {
      for (TextBlock block in recognisedText.blocks) {
        index++;
        for (TextLine line in block.lines) {
          if (line.text.length == 0)
            break;
          else {
            if (line.text.contains("会社", 0) == true) {
              _controllers[2].text = line.text;
            }
            if (line.text.contains("〒", 0) == true) {
              _controllers[44].text = line.text.splitAfter(" ");
            }
            if (line.text.contains("http://", 0) == true) {
              _controllers[53].text = line.text;
            }
            if (line.text.contains("E-mail:", 0) == true) {
              _controllers[43].text = line.text.substring(7);
            }
            if (line.text.contains("TEL", 0) == true) {
              _controllers[41].text = line.text.splitAfter(")");
              if (line.text.contains("FAX") == true) {
                _controllers[41].text =
                    line.text.splitAfter(")").splitBefore("/");
              }
            }
          }
          print(line.text);
        }
      }
    });
  }

  Future<void> _pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      _controller = VideoPlayerController.file(file);
      final bytes = file.readAsBytesSync();
      video = base64Encode(bytes);
      _initializeVideoPlayerFuture = _controller.initialize();
      await GlobalVariables.uploadToCloudinary(file.path, 19, 1);
      setState(() {});
    }
  }

  Future<void> _checkNfcAvailability() async {
    bool isAvailable = await NfcManager.instance.isAvailable();
    setState(() {
      _isNfcAvailable = isAvailable;
    });
  }

  Future<void> _writeToNfc(String nickname) async {
    String url = nickname;
    NdefRecord record = NdefRecord.createUri(Uri.parse(url));
    NdefMessage message = NdefMessage([record]);
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      Ndef? ndef = Ndef.from(tag);
      if (ndef != null) {
        await ndef.write(message);
        await NfcManager.instance.stopSession();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _checkNfcAvailability();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeColor(Color color) {
    setState(() {
      for (var i = 0; i < listtiles.length; i++) {
        listtiles[i] = CardTextField(
          listtiles[i].index,
          listtiles[i]._controller,
          color,
        );
      }
    });
  }

  Widget AddOneScreen(String imagefile, String text1, String text2,
      String text3, double index) {
    return Container(
        height: 220,
        width: MediaQuery.of(context).size.width * (index),
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  text3 == ''
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.transparent,
                              contentPadding: EdgeInsets.all(0),
                              content: Container(
                                width: 400,
                                child: Image.file(
                                  File(imagefile),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            );
                          })
                      : null;
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * index,
                  height: 160,
                  child: Image.file(
                    File(imagefile),
                    fit: BoxFit.fitHeight,
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
        height: 220,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            AddOneScreen(imageFiles[4], _textValues[6], _textValues[7],
                _textValues[8], 0.45),
            AddOneScreen(imageFiles[5], _textValues[9], _textValues[10],
                _textValues[11], 0.45),
          ],
        ));
  }

  Widget AddThreeScreens(int index) {
    return CustomPage(
      dotscount: 2,
      pageInserts: [
        Row(
          children: [
            AddOneScreen(imageFiles[6], _textValues[12], _textValues[13],
                _textValues[14], 0.45),
            AddOneScreen(imageFiles[7], _textValues[15], _textValues[16],
                _textValues[17], 0.45),
          ],
        ),
        AddOneScreen(imageFiles[8], _textValues[18], _textValues[19],
            _textValues[20], 0.45),
      ],
      currentPage: index.toDouble(),
    );
  }

  Widget AddFourScreens(int index) {
    return CustomPage(
      dotscount: 2,
      pageInserts: [
        Row(
          children: [
            AddOneScreen(imageFiles[9], _textValues[21], _textValues[22],
                _textValues[23], 0.45),
            AddOneScreen(imageFiles[10], _textValues[24], _textValues[25],
                _textValues[26], 0.45),
          ],
        ),
        Row(
          children: [
            AddOneScreen(imageFiles[11], _textValues[27], _textValues[28],
                _textValues[29], 0.45),
            AddOneScreen(imageFiles[12], _textValues[30], _textValues[31],
                _textValues[32], 0.45),
          ],
        )
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
        final file = File(imageFiles[imageIndex]);
        if (imageIndex == 1) {
          GlobalVariables.mainImage.add(file);
          _recognizeText(file);
        }

        // final bytes = file.readAsBytesSync();
        // final _ocrtext = FlutterTesseractOcr.extractText(imageFiles[imageIndex],
        //     language: 'ja');
        // encoded = base64Encode(bytes);
        // print(_ocrtext);
      });
      await GlobalVariables.uploadToCloudinary(pickedFile.path, imageIndex, 1);
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
              onPressed: () {
                orderindex++;
                setState(() {
                  final content = _quillcontroller.document.toDelta().toJson();
                  info.add({
                    'text': content,
                    'order': orderindex,
                    'size': 6,
                    'startTime': GlobalVariables.reservationStart,
                    'endTime': GlobalVariables.reservationEnd
                  });
                  lines =
                      (_quillcontroller.document.length / 30).ceil().toDouble();
                  _quillcontroller1 = QuillController(
                      document: Document.fromJson(content),
                      selection:
                          TextSelection.collapsed(offset: content.length - 1));
                });
                Navigator.of(context).pop();
                widgetList1.add(Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 20,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    child: QuillProvider(
                      configurations:
                          QuillConfigurations(controller: _quillcontroller1),
                      child: Column(
                        children: [
                          Expanded(
                            child: QuillEditor(
                              focusNode: FocusNode(),
                              scrollController: ScrollController(
                                  initialScrollOffset: 0,
                                  keepScrollOffset: false),
                              configurations: QuillEditorConfigurations(
                                  padding: EdgeInsets.all(0),
                                  readOnly: true,
                                  showCursor: false),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]));
              },
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
    degimecontroller.text = "https://degime.net/";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.only(top: 10),
          content: SingleChildScrollView(
            child: Container(
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
                                controller: degimecontroller,
                                textheight: 25,
                                maxline: 1,
                                textwidth: 250,
                                suffix: IconButton(
                                    onPressed: () {}, icon: Icon(Icons.copy)),
                                callback: (text) => _addTextValue(text, 54),
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
                              onPressed: () async {
                                for (int i = 0;
                                    i < GlobalVariables.mainImage.length;
                                    i++) {}
                                print(degimecontroller.text.splitAfter('net/'));
                                for (int i = 0; i < info.length; i++) {
                                  info[i]['order'] = i;
                                  if (info[i]['size'] == 1) {
                                    imageLink1.add(info[i]);
                                  }
                                  if (info[i]['size'] == 2) {
                                    imageLink2.add(info[i]);
                                  }
                                  if (info[i]['size'] == 3) {
                                    imageLink3.add(info[i]);
                                  }
                                  if (info[i]['size'] == 4) {
                                    imageLink4.add(info[i]);
                                  }
                                  if (info[i]['size'] == 5) {
                                    videoLink.add(info[i]);
                                  }
                                  if (info[i]['size'] == 6) {
                                    textLink.add(info[i]);
                                  }
                                  if (info[i]['size'] == 7) {
                                    profileLink.add(info[i]);
                                  }
                                  if (info[i]['size'] == 8) {
                                    pdfLink.add(info[i]);
                                  }
                                  if (info[i]['size'] == 9) {
                                    mapLink.add(info[i]);
                                  }
                                  if (info[i]['size'] == 10) {
                                    spaceAdd.add(info[i]);
                                  }
                                }
                                await publicCard();
                                GlobalVariables.landingurl =
                                    degimecontroller.text;
                                GlobalVariables.landingavatar =
                                    GlobalVariables.imageUrls[0];
                                imageLink1 = [];
                                imageLink2 = [];
                                imageLink3 = [];
                                imageLink4 = [];
                                videoLink = [];
                                textLink = [];
                                mapLink = [];
                                profileLink = [];
                                pdfLink = [];
                                _checkNfcAvailability();
                                _isNfcAvailable
                                    ? _writeToNfc(degimecontroller.text)
                                    : Fluttertoast.showToast(
                                        msg: "NFC is not connected.");
                                Navigator.of(context).pop();
                              },
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
          ),
        );
      },
    );
  }

  Widget _pageView(int index, int textorder, String imageUrl) {
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
                imageUrl: imageUrl,
                onPress: () async {
                  await pickImage(context, index);
                  Navigator.of(context).pop();
                  if (index == 3) {
                    _controllers[5].text = '';
                    _showOneScreenAdd(context);
                  } else if (index == 4) {
                    _controllers[8].text = '';
                    _showTwoScreensAdd(context, 0);
                  } else if (index == 5) {
                    _controllers[11].text = '';
                    _showTwoScreensAdd(context, 1);
                  } else if (index == 6) {
                    _controllers[14].text = '';
                    _showThreeScreensAdd(context, 0);
                  } else if (index == 7) {
                    _controllers[17].text = '';
                    _showThreeScreensAdd(context, 1);
                  } else if (index == 8) {
                    _controllers[20].text = '';
                    _showThreeScreensAdd(context, 2);
                  } else if (index == 9) {
                    _controllers[23].text = '';
                    _showFourScreensAdd(context, 0);
                  } else if (index == 10) {
                    _controllers[26].text = '';
                    _showFourScreensAdd(context, 1);
                  } else if (index == 11) {
                    _controllers[29].text = '';
                    _showFourScreensAdd(context, 2);
                  } else if (index == 12) {
                    _controllers[32].text = '';
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
                completeCall: () {
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
                },
                callback: (text) {
                  _addTextValue(text, textorder + 2);
                },
                hinttext: 'URL'),
          ],
        ));
  }

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _pdfFile = File(result.files.single.path!);
      });
      await GlobalVariables.uploadToCloudinary(_pdfFile!.path, 20, 1);
    }
  }

  Widget PdfScreen(File filepath) {
    return Center(
      child: Container(
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
                    height: 230,
                    child: SfPdfViewer.file(filepath)),
                10.height,
                Container(
                  child: Column(
                    children: [
                      Text(
                        _controllers[55].text,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        _controllers[56].text,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: 150,
                  height: 25,
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
              ])),
    );
  }

  Widget MapScreen() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.8,
        height: 300,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 280,
            child: WebViewWidget(controller: _webcontroller1)),
      ),
    );
  }

  Widget SpaceScreen() {
    return Stack(children: [
      Container(
          padding: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 5 * GlobalVariables.space,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
          )),
    ]);
  }

  Widget VideoScreen(VideoPlayerController controller) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15,
        ),
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.7,
        height: 220,
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (controller.value.isPlaying) {
                controller.pause();
              } else {
                controller.play();
              }
            });
          },
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  void _showMaporMovie(BuildContext context, String url, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          content: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width * 0.8,
                height: index != 35 ? 310 : 380,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.black.withOpacity(0.3), width: 1.0),
                        ),
                        child: index == 35
                            ? _pdfFile != null
                                ? SfPdfViewer.file(_pdfFile!)
                                : IconButton(
                                    icon: SvgPicture.asset(
                                        'assets/images/upload.svg'),
                                    onPressed: () async {
                                      await _pickPDF();
                                      Navigator.of(context).pop();
                                      _showMaporMovie(context, url, index);
                                    })
                            : index == 33
                                ? GestureDetector(
                                    onTap: () async {
                                      await _pickVideo();
                                      Navigator.of(context).pop();
                                      _showMaporMovie(context, url, index);
                                    },
                                    child: FutureBuilder(
                                      future: _initializeVideoPlayerFuture,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return AspectRatio(
                                            aspectRatio:
                                                _controller.value.aspectRatio,
                                            child: VideoPlayer(_controller),
                                          );
                                        } else {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      },
                                    ),
                                  )
                                : index == 34
                                    ? Center(
                                        child: WebViewWidget(
                                            controller: _webcontroller))
                                    : IconButton(
                                        icon: SvgPicture.asset(
                                            'assets/images/upload.svg'),
                                        onPressed: () {
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
                    5.height,
                    index == 35
                        ? ComTextField(
                            controller: _controllers[55],
                            textheight: 35,
                            textwidth: MediaQuery.of(context).size.width * 0.7,
                            callback: (text) => _addTextValue(text, 55),
                            hinttext: 'タイトル')
                        : 5.height,
                    5.height,
                    index == 35
                        ? ComTextField(
                            controller: _controllers[56],
                            textheight: 35,
                            textwidth: MediaQuery.of(context).size.width * 0.7,
                            callback: (text) => _addTextValue(text, 56),
                            hinttext: 'テキスト')
                        : 5.height,
                  ],
                )),
          ),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            index == 35
                ? Container(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MyCheckbox(
                                onChanged: (bool? value) {
                                  checked = value!;
                                },
                              ),
                              Text('ダウンロードを許可する')
                            ],
                          ),
                        ],
                      ),
                    ))
                : index == 33
                    ? Center(
                        child: Container(
                          padding: EdgeInsets.all(0),
                          width: 200,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.play();
                                    });
                                  },
                                  child: Text('Play')),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _controller.pause();
                                    });
                                  },
                                  child: Text('Stop'))
                            ],
                          ),
                        ),
                      )
                    : 5.height,
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
                      orderindex++;
                      setState(() {
                        if (index == 35 && checked == true) {
                          Navigator.of(context).pop();
                          widgetList1.add(PdfScreen(_pdfFile!));
                          info.add({
                            'url': GlobalVariables.imageUrls[20],
                            'title': _controllers[55],
                            'text': _controllers[56],
                            'order': orderindex,
                            'size': 8,
                            'startTime': GlobalVariables.reservationStart,
                            'endTime': GlobalVariables.reservationEnd
                          });
                        }
                        if (index == 33) {
                          Navigator.of(context).pop();
                          widgetList1.add(VideoScreen(_controller));
                          info.add({
                            'url': GlobalVariables.imageUrls[19],
                            'order': orderindex,
                            'size': 5,
                            'startTime': GlobalVariables.reservationStart,
                            'endTime': GlobalVariables.reservationEnd
                          });
                        }
                        if (index == 34) {
                          Navigator.of(context).pop();
                          widgetList1.add(MapScreen());
                          info.add({
                            'imgLink': '',
                            'mapLink': mapurl,
                            'order': orderindex,
                            'size': 9,
                            'startTime': GlobalVariables.reservationStart,
                            'endTime': GlobalVariables.reservationEnd
                          });
                        }
                      });
                    },
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
              height: 300,
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
                            _color = Color(0xFFFF8F61);
                            _width = 45;
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
                            _color = Color(0xFFFF8F61);
                            _width = 45;
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
                            _color = Color(0xFFFF8F61);
                            _width = 45;
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
                            _color = Color(0xFFFF8F61);
                            _width = 120;
                          });
                        },
                      ),
                    ],
                  ),
                  10.height,
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
                            _color = Color(0xFFFF8F61);
                            _width = 140;
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
                            _color = Color(0xFFFF8F61);
                            _width = 140;
                          });
                        },
                      ),
                    ],
                  ),
                  10.height,
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
                            _color = Color(0xFFFF8F61);
                            _width = 80;
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
                            _color = Color(0xFFFF8F61);
                            _width = 80;
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
                            _color = Color(0xFF9747FF);
                            _width = 120;
                          });
                        },
                      ),
                    ],
                  ),
                  10.height,
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
                            _color = Color(0xFF9747FF);
                            _width = 160;
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
                            _color = Color(0xFF4F4F4F);
                            _width = 130;
                          });
                        },
                      ),
                    ],
                  ),
                  10.height,
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
                            _color = Color(0xFF9747FF);
                            _width = 160;
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
                            _color = Color(0xFF4F4F4F);
                            _width = 120;
                          });
                        },
                      ),
                    ],
                  ),
                  10.height,
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
                  10.height,
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
              onPressed: () {
                orderindex++;
                setState(() {
                  widgetList1.add(SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SelectButton(
                          title: _controllers[37].text,
                          width: _width,
                          backgroundColor: _color,
                        ),
                        Text(
                          _controllers[38].text,
                          style: TextStyle(fontSize: 20),
                        ),
                        10.height
                      ],
                    ),
                  ));
                });
                Navigator.of(context).pop();
                info.add({
                  'title': _controllers[37].text,
                  'content': _controllers[38].text,
                  'order': orderindex,
                  'size': 7,
                  'startTime': GlobalVariables.reservationStart,
                  'endTime': GlobalVariables.reservationEnd
                });
                _controllers[37].clear();
                _controllers[38].clear();
              },
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
                    onPressed: () {
                      orderindex++;
                      setState(() {
                        GlobalVariables.space = space.toDouble();
                        Navigator.of(context).pop();
                        widgetList1.add(SpaceScreen());
                        info.add(
                            {'space': space, 'order': orderindex, 'size': 10});
                      });
                    },
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
          content: _pageView(3, 3, _textValues[5]),
          actionsPadding: EdgeInsets.all(0),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.delete)),
            IconButton(
              onPressed: () {
                orderindex++;
                setState(() {
                  widgetList1.add(AddOneScreen(imageFiles[3], _textValues[3],
                      _textValues[4], _textValues[5], 0.9));
                  info.add({
                    'title': _controllers[3].text,
                    'text': _controllers[4].text,
                    'url': _controllers[5].text == ''
                        ? GlobalVariables.imageUrls[3]
                        : _controllers[5].text,
                    'order': orderindex,
                    'size': 1,
                    'startTime': '',
                    'endTime': ''
                  });
                  Navigator.of(context).pop();
                });
              },
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

  void _showTwoScreensAdd(BuildContext context, int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            dotscount: 2,
            pageInserts: [
              _pageView(4, 6, _textValues[8]),
              _pageView(5, 9, _textValues[11])
            ],
            // pageInsert1: _pageView(4, 6),
            // pageInsert2: _pageView(5, 9),
            onPress: () {
              orderindex++;
              setState(() {
                widgetList1.add(AddTwoScreens());
                Navigator.of(context).pop();
                info.add({
                  'title1': _controllers[6].text,
                  'text1': _controllers[7].text,
                  'url1': GlobalVariables.imageUrls[4],
                  'title2': _controllers[9].text,
                  'text2': _controllers[10].text,
                  'url2': GlobalVariables.imageUrls[5],
                  'order': orderindex,
                  'size': 2,
                  'startTime': GlobalVariables.reservationStart,
                  'endTime': GlobalVariables.reservationEnd,
                });
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
            pageInserts: [
              _pageView(6, 12, _textValues[14]),
              _pageView(7, 15, _textValues[17]),
              _pageView(8, 18, _textValues[20])
            ],
            // pageInsert1: _pageView(4, 6),
            // pageInsert2: _pageView(5, 9),
            onPress: () {
              orderindex++;
              setState(() {
                widgetList1.add(AddThreeScreens(0));
                Navigator.of(context).pop();
                info.add({
                  'title1': _controllers[12].text,
                  'text1': _controllers[13].text,
                  'url1': GlobalVariables.imageUrls[6],
                  'title2': _controllers[15].text,
                  'text2': _controllers[16].text,
                  'url2': GlobalVariables.imageUrls[7],
                  'title3': _controllers[18].text,
                  'text3': _controllers[19].text,
                  'url3': GlobalVariables.imageUrls[8],
                  'order': orderindex,
                  'size': 3,
                  'startTime': GlobalVariables.reservationStart,
                  'endTime': GlobalVariables.reservationEnd,
                });
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
              _pageView(9, 21, _textValues[23]),
              _pageView(10, 24, _textValues[26]),
              _pageView(11, 27, _textValues[29]),
              _pageView(12, 30, _textValues[32])
            ],
            // pageInsert1: _pageView(4, 6),
            // pageInsert2: _pageView(5, 9),
            onPress: () {
              orderindex++;
              setState(() {
                widgetList1.add(AddFourScreens(0));
                Navigator.of(context).pop();
                info.add({
                  'title1': _controllers[21].text,
                  'text1': _controllers[22].text,
                  'url1': GlobalVariables.imageUrls[9],
                  'title2': _controllers[24].text,
                  'text2': _controllers[25].text,
                  'url2': GlobalVariables.imageUrls[10],
                  'title3': _controllers[27].text,
                  'text3': _controllers[28].text,
                  'url3': GlobalVariables.imageUrls[11],
                  'title4': _controllers[30].text,
                  'text4': _controllers[31].text,
                  'url4': GlobalVariables.imageUrls[12],
                  'order': orderindex,
                  'size': 4,
                  'startTime': GlobalVariables.reservationStart,
                  'endTime': GlobalVariables.reservationEnd,
                });
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

  late List<CardTextField> listtiles = [
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
                          Navigator.of(context).pop();
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
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                        color: const Color(0xFF2A08F8),
                                        width: 3.0)),
                                child: imageFiles[1] != "1" ||
                                        widget.imagefile != null ||
                                        GlobalVariables.mainImage.length > 0
                                    ? PageView(
                                        controller: _pageController1,
                                        onPageChanged: (value) {
                                          setState(() {
                                            currentpage = value;
                                          });
                                        },
                                        children: [
                                          for (int i = 0;
                                              i <
                                                  GlobalVariables
                                                      .mainImage.length;
                                              i++)
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                ),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            contentPadding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            content: Container(
                                                              width: 200,
                                                              height: 500,
                                                              child: Image.file(
                                                                GlobalVariables
                                                                    .mainImage[i],
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Image.file(
                                                    GlobalVariables
                                                        .mainImage[i],
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ))
                                        ],
                                      )
                                    : null,
                              )
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
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    CameraScreen(
                                                                      str1: _controllers[
                                                                              2]
                                                                          .text,
                                                                      str2: _controllers[
                                                                              44]
                                                                          .text,
                                                                      str3: _controllers[
                                                                              53]
                                                                          .text,
                                                                      str4: _controllers[
                                                                              43]
                                                                          .text,
                                                                      str5: _controllers[
                                                                              41]
                                                                          .text,
                                                                    )),
                                                      );
                                                    },
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
                                  })),
                          Positioned(
                              top: 0,
                              left: GlobalVariables.mainImage.length > 1
                                  ? screenWidth * 0.3
                                  : -100,
                              child: DotsIndicator(
                                dotsCount: GlobalVariables.mainImage.length == 0
                                    ? 1
                                    : GlobalVariables.mainImage.length,
                                position: currentpage,
                                decorator: DotsDecorator(
                                  color: Colors.grey,
                                  activeColor: Colors.grey,
                                  size: const Size.square(5.0),
                                  activeSize: const Size(10.0, 5.0),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                ),
                              ))
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
                                  maxline: 1,
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
                                        imageUrl: '',
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
                                        imageUrl: '',
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
                                        imageUrl: '',
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
                                        imageUrl: '',
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
                                                                changeColor(
                                                                    color);
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
                              : 220 *
                                      widgetList1
                                          .where((widget) =>
                                              widget.runtimeType == Container)
                                          .length
                                          .toDouble() +
                                  300 *
                                      widgetList1
                                          .where((widget) =>
                                              widget.runtimeType == Center)
                                          .length
                                          .toDouble() +
                                  80 *
                                      widgetList1
                                          .where((widget) =>
                                              widget.runtimeType == SizedBox)
                                          .length
                                          .toDouble() +
                                  (5 * GlobalVariables.space) *
                                      widgetList1
                                          .where((widget) =>
                                              widget.runtimeType == Stack)
                                          .length
                                          .toDouble() +
                                  150 *
                                      widgetList1
                                          .where((widget) =>
                                              widget.runtimeType == Column)
                                          .length
                                          .toDouble(),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widgetList1.length,
                              itemBuilder: (context, index) {
                                return LongPressDraggable<int>(
                                  data: index,
                                  child: DragTarget<int>(
                                    onWillAccept: (data) => true,
                                    onAccept: (data) {
                                      setState(() {
                                        final draggedelement =
                                            widgetList1[data];
                                        final draggedinfo = info[data];
                                        widgetList1.removeAt(data);
                                        info.removeAt(data);
                                        widgetList1.insert(
                                            index, draggedelement);
                                        info.insert(index, draggedinfo);
                                      });
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return Stack(
                                        children: [
                                          widgetList1[index],
                                          Positioned(
                                              top: -10,
                                              right: 10,
                                              child: IconButton(
                                                icon:
                                                    Icon(Icons.cancel_outlined),
                                                onPressed: () {
                                                  setState(() {
                                                    widgetList1.removeAt(index);
                                                    info.removeAt(index);
                                                  });
                                                },
                                              ))
                                        ],
                                      );
                                    },
                                  ),
                                  feedback: widgetList1[index],
                                  childWhenDragging: Container(),
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
                        onPressed: () async {
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
                  20.height,
                ],
              ),
            ),
          ),
        ));
  }
}

class CameraScreen extends StatefulWidget {
  String? str1;
  String? str2;
  String? str3;
  String? str4;
  String? str5;
  CameraScreen(
      {super.key, this.str1, this.str2, this.str3, this.str4, this.str5});
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _recognizeText(File processedImage, String str1, String str2,
      String str3, String str4, String str5) async {
    int index = 0;
    final inputImage = InputImage.fromFile(processedImage);
    final textRecognizer = GoogleMlKit.vision
        .textRecognizer(script: TextRecognitionScript.japanese);
    final recognisedText = await textRecognizer.processImage(inputImage);
    String recognizedText = recognisedText.text;
    setState(() {
      for (TextBlock block in recognisedText.blocks) {
        index++;
        for (TextLine line in block.lines) {
          if (line.text.length == 0)
            break;
          else {
            if (line.text.contains("会社", 0) == true) {
              str1 = line.text;
            }
            if (line.text.contains("〒", 0) == true) {
              str2 = line.text.splitAfter(" ");
            }
            if (line.text.contains("http://", 0) == true) {
              str3 = line.text;
            }
            if (line.text.contains("E-mail:", 0) == true) {
              str4 = line.text.substring(7);
            }
            if (line.text.contains("TEL", 0) == true) {
              str5 = line.text.splitAfter(")");
              if (line.text.contains("FAX") == true) {
                str5 = line.text.splitAfter(")").splitBefore("/");
              }
            }
          }
          print(line.text);
        }
      }
    });
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;
      final Directory directory = await getApplicationCacheDirectory();
      final String filePath = '${directory.path}/picture.jpg';
      final XFile picture = await _controller.takePicture();
      final File file = File(filePath);
      await file.writeAsBytes(await picture.readAsBytes());
      setState(() {
        _imageFile = file;
        GlobalVariables.mainImage.add(file);
        GlobalVariables.uploadToCloudinary(file.path, 1, 1);
        _recognizeText(file, widget.str1!, widget.str2!, widget.str3!,
            widget.str4!, widget.str5!);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _takePicture();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OnlineCard(
                      imagefile: _imageFile,
                    )),
          );
        },
        child: Icon(Icons.camera),
      ),
    );
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

QuillController _quillcontroller = QuillController.basic();

class QuillEditorPage extends StatefulWidget {
  const QuillEditorPage({super.key});
  @override
  State<QuillEditorPage> createState() => _QuillEditorPageState();
}

class _QuillEditorPageState extends State<QuillEditorPage> {
  @override
  Widget build(BuildContext context) {
    return QuillProvider(
      configurations: QuillConfigurations(controller: _quillcontroller),
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
