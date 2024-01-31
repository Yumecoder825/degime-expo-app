import 'package:degime_131/utils/Okbutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:degime_131/screen/Register_page.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:degime_131/utils/Global_variable.dart';
import 'package:degime_131/utils/FunctionButton.dart';

class LoginPage extends StatefulWidget {
  var token;
  LoginPage({super.key, this.token});
  static String tag = "/LoginPage";
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _obscureText = true;
  String _inputText1 = '';
  String _inputText2 = '';
  String _inputText3 = '';
  String _inputText4 = '';
  List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(7, (index) => FocusNode());
  Icon eye2 = const Icon(Icons.visibility_off);
  Icon eye1 = const Icon(Icons.visibility_outlined);
  Icon eye = const Icon(Icons.visibility_off);
  String token = '';
  String forgotToken = '';

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
                  FocusScope.of(context).unfocus();
                  String finaldigit = _controllers[0].text +
                      _controllers[1].text +
                      _controllers[2].text +
                      _controllers[3].text +
                      _controllers[4].text +
                      _controllers[5].text;
                  forgotValidate(_inputText1, finaldigit);
                } else {
                  FocusScope.of(context).requestFocus(_focusNodes[index]);
                }
              }
              if (text == '') {
                if (index == 1) {
                  FocusScope.of(context).requestFocus(_focusNodes[0]);
                } else
                  FocusScope.of(context).requestFocus(_focusNodes[index - 2]);
              }
              if (words.length == 6) {
                _controllers[0].text = words[0];
                _controllers[1].text = words[1];
                _controllers[2].text = words[2];
                _controllers[3].text = words[3];
                _controllers[4].text = words[4];
                _controllers[5].text = words[5];
                FocusScope.of(context).unfocus();
                forgotValidate(
                    _inputText1,
                    _controllers[0].text +
                        _controllers[1].text +
                        _controllers[2].text +
                        _controllers[3].text +
                        _controllers[4].text +
                        _controllers[5].text);
              }
            }));
  }

  Future<void> logout() async {
    var url = Uri.parse('http://194.87.199.12:5000/account/logout');
    var object = {'Authorization': 'token $token'};
    final response = await http.get(url, headers: object);
    if (response.statusCode == 200) {
      // Logout successful, clear user-related data or tokens
      print(json.decode(response.body));
    } else {
      // Handle error
    }
  }

  Future<void> login(String username, String password) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    var url = Uri.parse('http://194.87.199.12:5000/account/login');
    var data = {
      "username": username,
      "password": password,
    };

    final requestBody = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody);
    print(json.decode(response.body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Authentication successful, store the token
      // Store the token locally on the device
      // Example: SharedPreferences.getInstance().then((prefs) => prefs.setString('token', token));
      token = json.decode(response.body)['token'];
      GlobalVariables.token = token;
      GlobalVariables.username = json.decode(response.body)['username'];
    } else {
      // Authentication failed
      throw Exception('Failed to login');
    }
  }

  Future<void> forgotPassword(String email) async {
    var url = Uri.parse('http://194.87.199.12:5000/account/forgot_password');
    var data = {"email": email};

    final requestBody = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody);
    print(json.decode(response.body));
    if (_inputText1 != '') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                padding: EdgeInsets.all(0),
                height: 150,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'メールに送られたコードを\n入力してください',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 220,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Visibility(
                                visible: true,
                                child: digit(context, _controllers[0], 1),
                              ),
                              digit(context, _controllers[1], 2),
                              digit(context, _controllers[2], 3),
                              digit(context, _controllers[3], 4),
                              digit(context, _controllers[4], 5),
                              digit(context, _controllers[5], 6),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FunctionButton(
                            title: '再送する',
                            wordcolor: Colors.white,
                            width: 96,
                            height: 30,
                            bordercolor: Colors.transparent,
                            fillcolor: Color(0xFFFF8F61),
                            onPressed: () {
                              _controllers
                                  .forEach((controller) => controller.clear());
                            })
                      ],
                    )
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.all(0),
              actions: [],
            );
          });

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Authentication successful, store the token
        // Store the token locally on the device
        // Example: SharedPreferences.getInstance().then((prefs) => prefs.setString('token', token));
        //forgotToken = json.decode(response.body)["token"];
      } else {
        // Authentication failed
        throw Exception('Failed to Forgot Password');
      }
    }
  }

  Future<void> passwordReset(String password) async {
    var url = Uri.parse('http://194.87.199.12:5000/account/password_reset');
    var object = {
      'Authorization': 'token $forgotToken',
      'Content-Type': 'application/json'
    };
    var data = {
      "new_password": password,
    };

    final requestBody = jsonEncode(data);
    final response = await http.post(url, headers: object, body: requestBody);
    print(json.decode(response.body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Authentication successful, store the token
      // Store the token locally on the device
      // Example: SharedPreferences.getInstance().then((prefs) => prefs.setString('token', token));
      var message = json.decode(response.body);
      Navigator.of(context).pop();
    } else {
      // Authentication failed
      throw Exception('Failed to Reset');
    }
  }

  Future<void> forgotValidate(String email, String vcode) async {
    var url = Uri.parse('http://194.87.199.12:5000/account/validate_code');
    var data = {
      "email": email,
      "vcode": vcode,
    };

    final requestBody = jsonEncode(data);
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody);
    print(json.decode(response.body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Authentication successful, store the token
      // Store the token locally on the device
      // Example: SharedPreferences.getInstance().then((prefs) => prefs.setString('token', token));
      forgotToken = json.decode(response.body)['token'];
      print(forgotToken);
      Navigator.of(context).pop();
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                padding: EdgeInsets.all(0),
                height: 140,
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              obscureText: true,
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
                              ),
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
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: TextField(
                              obscureText: true,
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
                              ),
                              onChanged: (text) {
                                setState(() {
                                  _inputText4 = text;
                                });
                              },
                            ))
                      ],
                    ),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.all(5),
              actions: [
                Center(
                  child: Okbutton(
                    onPressed: () {
                      if (_inputText3 == _inputText4) {
                        passwordReset(_inputText3);
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Please type correct password',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      }
                    },
                  ),
                )
              ],
            );
          });
    } else {
      // Authentication failed
      throw Exception('Failed to login');
    }
  }

  void _toggleObscureText() {
    setState(() {
      if (eye == eye1) {
        eye = eye2;
      } else {
        eye = eye1;
      }
      _obscureText = !_obscureText;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Image(
                        image:
                            const AssetImage('assets/images/degime_logo.png'),
                        width: screenWidth,
                        height: 150,
                        alignment: Alignment.topLeft,
                      ),
                      Positioned(
                          top: 80,
                          child: Container(
                            width: screenWidth,
                            child: const Text(
                              "ログイン",
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
                  )
                ],
              ),
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
                                text: 'アカウント登録がお済みでない方は、',
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
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          RegisterPage().launch(context);
                                        })
                                ]),
                          ),
                          const Text(
                            "から新規登録できます",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          )
                        ],
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: screenWidth * 0.9,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "ユーザー名かメールアドレスを入力してください",
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
                            _inputText1 = text;
                          });
                        },
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: screenWidth * 0.9,
                      child: TextField(
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            hintText: "パスワードを入力してください",
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
                                  _toggleObscureText();
                                }),
                            suffixIconColor: const Color(0xFF000842)),
                        onChanged: (text) {
                          setState(() {
                            _inputText2 = text;
                          });
                        },
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      width: screenWidth * 0.9,
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          //logout();
                          forgotPassword(_inputText1);
                        },
                        child: const Text(
                          'パスワードを忘れた方',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.end,
                        ),
                      ))
                ],
              ),
              40.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: screenWidth * 0.9,
                      height: 50,
                      child: OutlinedButton(
                          onPressed: () async {
                            await login(_inputText1, _inputText2);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LandingPage()));
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: const Color(0xFF2AC3FF),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          child: const Text(
                            "ログイン",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          )))
                ],
              ),
              60.height,
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
                            image: AssetImage('assets/images/google_logo.png'),
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
