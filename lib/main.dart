import 'package:degime_131/screen/BCardChat_page.dart';
import 'package:degime_131/screen/ChatApply_page.dart';
import 'package:degime_131/screen/Chat_page.dart';
import 'package:degime_131/screen/DataManage_page.dart';
import 'package:degime_131/screen/FolderCreate_page.dart';
import 'package:degime_131/screen/Landing_next.dart';
import 'package:degime_131/screen/Login_page.dart';
import 'package:degime_131/screen/OnlineCard_page.dart';
import 'package:degime_131/screen/Register_page.dart';
import 'package:degime_131/screen/ReleaseOnline_page.dart';
import 'package:degime_131/screen/ReleaseSNS_page.dart';
import 'package:degime_131/screen/SNSCard_page.dart';
import 'package:degime_131/screen/Setting_page.dart';
import 'package:degime_131/screen/Shop_page1.dart';
import 'package:degime_131/screen/Shop_page2.dart';
import 'package:degime_131/screen/Shop_page3.dart';
import 'package:degime_131/screen/Shop_page4.dart';
import 'package:degime_131/screen/Theme_select.dart';
import 'package:flutter/material.dart';
import 'package:degime_131/screen/Menu_page.dart';
import 'package:degime_131/screen/Landing_page.dart';
import 'package:degime_131/screen/BCardManage_page1.dart';
import 'package:degime_131/screen/BCardManage_page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Degime', home: SNSCard());
  }
}
