import 'package:degime_131/screen/OnlineCard_page.dart';
import 'package:degime_131/screen/SNSCard_page.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ThemeSelect extends StatefulWidget {
  const ThemeSelect({super.key});
  static String tag = "/ThemeSelect";
  @override
  State<ThemeSelect> createState() => _ThemeSelect();
}

class _ThemeSelect extends State<ThemeSelect> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              backgroundColor: const Color(0xFFF2F2F7),
              bottom: const TabBar(
                indicatorColor: Color(0xFF9747FF),
                unselectedLabelColor: Colors.black,
                labelColor: Color(0xFF9747FF),
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                tabs: [Tab(text: 'オンライン名刺'), Tab(text: 'SNSリンクツリー')],
              ),
            ),
            body: const TabBarView(
              children: [
                FirstScreen(),
                SecondScreen(),
              ],
            ),
          )),
    );
  }
}

class ThemeSelect2 extends StatefulWidget {
  const ThemeSelect2({super.key});
  static String tag = "/ThemeSelect1";
  @override
  State<ThemeSelect2> createState() => _ThemeSelect2();
}

class _ThemeSelect2 extends State<ThemeSelect2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(0); // Select the second tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFF2F2F7),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFF9747FF),
          unselectedLabelColor: Colors.black,
          labelColor: Color(0xFF9747FF),
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          tabs: [Tab(text: 'オンライン名刺'), Tab(text: 'SNSリンクツリー')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FirstScreen(),
          SecondScreen(),
        ],
      ),
    );
  }
}


class ThemeSelect1 extends StatefulWidget {
  const ThemeSelect1({super.key});
  static String tag = "/ThemeSelect1";
  @override
  State<ThemeSelect1> createState() => _ThemeSelect1();
}

class _ThemeSelect1 extends State<ThemeSelect1>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animateTo(1); // Select the second tab
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: const Color(0xFFF2F2F7),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFF9747FF),
          unselectedLabelColor: Colors.black,
          labelColor: Color(0xFF9747FF),
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          tabs: [Tab(text: 'オンライン名刺'), Tab(text: 'SNSリンクツリー')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FirstScreen(),
          SecondScreen(),
        ],
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          5.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.8,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border:
                        Border.all(color: const Color(0xFF2A08F8), width: 3.0)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(55.0)),
                child: Icon(
                  Icons.add,
                  size: 25,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
              20.width,
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          width: 185,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                                  Border.all(color: Colors.black, width: 1.0)),
                          child: Text(
                            '氏名',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.3)),
                          )),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          5.width,
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          5.width,
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          5.width,
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
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
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: screenWidth * 0.7,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        width: 1.0, color: Colors.black.withOpacity(0.3))),
                child: Text(
                  '会社名',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: screenWidth * 0.7,
                  height: 45,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnlineCard()));
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: const Color(0xFF2AC3FF),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "このテーマを選択する",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )))
            ],
          ),
          10.height
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
                                color: const Color(0xFF2A08F8), width: 3.0)),
                      ),
                      60.height,
                    ],
                  ),
                  Positioned(
                      left: screenWidth * 0.4 - 55,
                      top: screenHeight * 0.3 - 55,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9),
                            borderRadius: BorderRadius.circular(55.0),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      )),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: SvgPicture.asset('assets/images/note.svg'))
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: screenWidth * 0.7,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: Text(
                  'アカウント名',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: screenWidth * 0.7,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(width: 1.0, color: Colors.black)),
                child: Text(
                  'プロフィール',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.3),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    width: screenWidth * 0.7,
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black, width: 1.0)),
                  ),
                  Positioned(
                      top: 10,
                      right: 5,
                      child: SvgPicture.asset('assets/images/cancel.svg')),
                  Positioned(
                      top: 10,
                      right: 30,
                      child: SvgPicture.asset('assets/images/note.svg')),
                  Positioned(
                    top: 3,
                    left: screenWidth * 0.28,
                    child: SvgPicture.asset('assets/images/move.svg'),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        width: 86,
                        height: 86,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      7.width,
                      Container(
                        width: 86,
                        height: 86,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      7.width,
                      Container(
                        width: 86,
                        height: 86,
                        decoration: const BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 3,
                    left: screenWidth * 0.28,
                    child: SvgPicture.asset(
                      'assets/images/move.svg',
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 3,
                    child: SvgPicture.asset('assets/images/note.svg'),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: screenWidth * 0.7,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2), width: 1.0)),
                  child: Text(
                    'リンク追加',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 10, color: Colors.black.withOpacity(0.3)),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: screenWidth * 0.7,
                  height: 45,
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SNSCard()));
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        backgroundColor: const Color(0xFF2AC3FF),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        "このテーマを選択する",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )))
            ],
          ),
          20.height
        ],
      ),
    );
  }
}
