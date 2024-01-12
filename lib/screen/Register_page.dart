import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:degime_131/utils/ComTextfield.dart';
import 'package:degime_131/utils/FunctionButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:degime_131/screen/Login_page.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String tag = "/RegisterPage";
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  String _inputText1 = '';
  String _inputText2 = '';
  String _inputText3 = '';
  String _inputText4 = '';
  Icon eye2 = const Icon(Icons.visibility_off);
  Icon eye1 = const Icon(Icons.visibility_outlined);
  Icon eye = const Icon(Icons.visibility_off);
  Icon eye3 = const Icon(Icons.visibility_off);
  TextEditingController _controller1 = TextEditingController();
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(7, (index) => FocusNode());

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  Widget digit(
      BuildContext context, TextEditingController _controller, int index) {
    return Container(
      padding: EdgeInsets.all(0),
      width: 30,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1.0)),
      child: TextField(
        controller: _controller,
        focusNode: _focusNodes[index - 1],
        style: TextStyle(
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
        onChanged: (text) {
          List<String> words = text.split('');
          if (words.length == 1) {
            if (index == 6) {
              FocusScope.of(context).requestFocus(_focusNodes[0]);
            } else
              FocusScope.of(context).requestFocus(_focusNodes[index]);
          }
        },
      ),
    );
  }

  Future<void> registerUser(
      String username, String email, String password, String password2) async {
    var url = Uri.parse('http://194.87.199.12:8000/account/register/');
    var data = {
      "username": username,
      "email": email,
      "password": password,
      "password2": password2,
    };

    final requestBody = jsonEncode(data);
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody);
    print(json.decode(response.body));
    // Handle the API response
    if (response.statusCode == 201) {
      // Registration successful
      var responseData = json.decode(response.body);
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      // Do something with the response data
    } else {
      // Registration failed
      var error = json.decode(response.body)['error'];
      print("error");
      // Show error message to the user
    }
  }

  // void _onChanged(String text) {
  //   setState(() {
  //     _inputText1 = text;
  //   });
  // }

  void _toggleObscureText1() {
    setState(() {
      if (eye == eye1) {
        eye = eye2;
      } else {
        eye = eye1;
      }
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggleObscureText2() {
    setState(() {
      if (eye3 == eye1) {
        eye3 = eye2;
      } else {
        eye3 = eye1;
      }
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image(
                              image:
                                  AssetImage('assets/images/degime_logo.png'),
                              width: screenWidth,
                              height: 150,
                              alignment: Alignment.topLeft,
                            ),
                            Positioned(
                                top: 80,
                                child: Container(
                                  width: screenWidth,
                                  child: const Text(
                                    "新規登録",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                              offset: Offset(0, 5),
                                              blurRadius: 5,
                                              color: Colors.grey)
                                        ]),
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 0, 20, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: 'すでに登録済みの方は、',
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          children: [
                                            TextSpan(
                                                text: 'こちら',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xFF4C31F4),
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        const LoginPage()
                                                            .launch(context);
                                                      }),
                                            const TextSpan(
                                                text: "からログイ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]),
                                    ),
                                    const Text(
                                      "ンできます",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.9,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "メールアドレスを入力してください",
                              labelText: "Eメール",
                              labelStyle: TextStyle(
                                  fontSize: 13, color: Color(0xFF999999)),
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Color(0xFF000842)),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                size: 20,
                              ),
                              prefixIconColor: Color(0xFF000842)),
                          onChanged: (text) {
                            setState(() {
                              _inputText2 = text;
                            });
                          },
                        ))
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.9,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "ユーザー名を入力してください",
                              labelText: "ユーザー名(半角英数字４文字以上)",
                              labelStyle: TextStyle(
                                  fontSize: 13, color: Color(0xFF999999)),
                              hintStyle: TextStyle(
                                  fontSize: 12, color: Color(0xFF000842)),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20,
                              ),
                              prefixIconColor: Color(0xFF000842)),
                          onChanged: (text) {
                            setState(() {
                              _inputText1 = text;
                            });
                          },
                        ))
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.9,
                        child: TextField(
                          obscureText: _obscureText1,
                          decoration: InputDecoration(
                              hintText: "半角英数字６文字以上",
                              labelText: "パスワード",
                              labelStyle: const TextStyle(
                                  fontSize: 13, color: Color(0xFF999999)),
                              hintStyle: const TextStyle(
                                  fontSize: 12, color: Color(0xFF000842)),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                size: 20,
                              ),
                              prefixIconColor: const Color(0xFF000842),
                              suffixIcon: IconButton(
                                  icon: eye,
                                  iconSize: 20,
                                  onPressed: () {
                                    _toggleObscureText1();
                                  }),
                              suffixIconColor: const Color(0xFF000842)),
                          onChanged: (text) {
                            setState(() {
                              _inputText3 = text;
                            });
                          },
                        ))
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.9,
                        child: TextField(
                          obscureText: _obscureText2,
                          decoration: InputDecoration(
                              hintText: "パスワード再入力",
                              labelText: "パスワードを再入力してください",
                              labelStyle: const TextStyle(
                                  fontSize: 13, color: Color(0xFF999999)),
                              hintStyle: const TextStyle(
                                  fontSize: 12, color: Color(0xFF000842)),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                size: 20,
                              ),
                              prefixIconColor: const Color(0xFF000842),
                              suffixIcon: IconButton(
                                  icon: eye3,
                                  iconSize: 20,
                                  onPressed: () {
                                    _toggleObscureText2();
                                  }),
                              suffixIconColor: const Color(0xFF000842)),
                          onChanged: (text) {
                            setState(() {
                              _inputText4 = text;
                            });
                          },
                        ))
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: '登録すると、',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                        text: '利用規約・プライバシーポリシー',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF4C31F4),
                                          fontWeight: FontWeight.bold,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {}),
                                    const TextSpan(
                                        text: "に同意",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ]),
                            ),
                            const Text(
                              "したとみなします",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black),
                            )
                          ],
                        ))
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: screenWidth * 0.9,
                        height: 50,
                        child: OutlinedButton(
                            onPressed: () {
                              // print(_inputText1 +
                              //     ' ' +
                              //     _inputText2 +
                              //     ' ' +
                              //     _inputText3 +
                              //     ' ' +
                              //     _inputText4);
                              // setState(() {
                              //   registerUser(_inputText1, _inputText2,
                              //       _inputText3, _inputText4);
                              // });
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        padding: EdgeInsets.all(0),
                                        height: 150,
                                        alignment: Alignment.center,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'メールに送られたコードを\n入力してください',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 220,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Visibility(
                                                        visible: true,
                                                        child: digit(context,
                                                          _controllers[0], 1),),
                                                      digit(context,
                                                          _controllers[1], 2),
                                                      digit(context,
                                                          _controllers[2], 3),
                                                      digit(context,
                                                          _controllers[3], 4),
                                                      digit(context,
                                                          _controllers[4], 5),
                                                      digit(context,
                                                          _controllers[5], 6),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            FunctionButton(
                                                title: '確認',
                                                wordcolor: Colors.white,
                                                width: 65,
                                                height: 30,
                                                bordercolor: Colors.transparent,
                                                fillcolor: Color(0xFFFF8F61),
                                                onPressed: () {
                                                  _controllers.forEach(
                                                      (controller) =>
                                                          controller.clear());
                                                })
                                          ],
                                        ),
                                      ),
                                      actionsPadding: EdgeInsets.all(0),
                                      actions: [],
                                    );
                                  });
                            },
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              backgroundColor: const Color(0xFF2AC3FF),
                              side: BorderSide.none,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            child: const Text(
                              "新規登録",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )))
                  ],
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              String url = await _generateFacebookUrl();
                              await launch(url);
                            },
                            child: const Image(
                              image:
                                  AssetImage('assets/images/facebook_logo.png'),
                              width: 35,
                            ),
                          ),
                          10.width,
                          GestureDetector(
                            onTap: () async {
                              String url = await _generateAppleUrl();
                              await launch(url);
                            },
                            child: const Image(
                              image: AssetImage('assets/images/apple_logo.png'),
                              width: 35,
                            ),
                          ),
                          10.width,
                          GestureDetector(
                            onTap: () async {
                              String url = await _generateGoogleUrl();
                              await launch(url);
                            },
                            child: const Image(
                              image:
                                  AssetImage('assets/images/google_logo.png'),
                              width: 35,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Future<String> _generateFacebookUrl() async {
    var uri = Uri.parse('https://www.facebook.com');
    return uri.toString();
  }

  Future<String> _generateAppleUrl() async {
    var uri = Uri.parse('https://www.apple.com');
    return uri.toString();
  }

  Future<String> _generateGoogleUrl() async {
    var uri = Uri.parse('https://www.google.com');
    return uri.toString();
  }
}
