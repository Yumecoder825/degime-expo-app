import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:degime_131/screen/Register_page.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String tag = "/LoginPage";
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _obscureText = true;
  String _inputText1 = '';
  String _inputText2 = '';
  Icon eye2 = const Icon(Icons.visibility_off);
  Icon eye1 = const Icon(Icons.visibility_outlined);
  Icon eye = const Icon(Icons.visibility_off);
  String token = '';

  Future<void> logout() async {
    var url = Uri.parse('http://194.87.199.12:8000/account/logout/');
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
    var url = Uri.parse('http://194.87.199.12:8000/account/login/');
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
    if (response.statusCode == 200) {
      // Authentication successful, store the token
      // Store the token locally on the device
      // Example: SharedPreferences.getInstance().then((prefs) => prefs.setString('token', token));
      token = json.decode(response.body)['token'];
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
                          logout();
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
                          onPressed: () {
                            login(_inputText1, _inputText2);
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             LandingPage()));
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
