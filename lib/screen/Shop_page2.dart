import 'package:degime_131/screen/Shop_page3.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ShopPage2 extends StatefulWidget {
  @override
  State<ShopPage2> createState() => _ShopPage2();
}

class _ShopPage2 extends State<ShopPage2> {
  String selectedValue = "1";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.7,
                    height: screenWidth * 0.7,
                    child: Image(
                      image: AssetImage('assets/images/nfccard1.png'),
                    ),
                  )
                ],
              ),
              10.height,
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    width: screenWidth,
                    child: Text(
                      'degimeカード',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' 商品コード A000000001',
                        style: TextStyle(fontSize: 16),
                      ),
                      RichText(
                          text: TextSpan(
                              text: ' 価格 ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                              children: [
                            TextSpan(
                                text: '3300円',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 20)),
                          ])),
                      RichText(
                          text: TextSpan(
                              text: ' 送料 ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              children: [
                            TextSpan(
                                text: '詳細はこちら',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 16)),
                          ])),
                      Row(
                        children: [
                          Text('数量 ', style: TextStyle(fontSize: 16)),
                          DropdownButton<String>(
                            alignment: Alignment.center,
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: <String>[
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
                              '6',
                              '7',
                              '8',
                              '9',
                              '10+',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Text(value),
                              );
                            }).toList(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 40,
                      child: Stack(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Container(
                                        height: 450,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'ショッピングカートに登録しました。',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            30.height,
                                            Row(
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'assets/images/nfccard.png'),
                                                  width: 100,
                                                ),
                                                20.width,
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('A000000002'),
                                                    Text('degimeカード２'),
                                                    Text('数量 : 1'),
                                                    Text('3,300円')
                                                  ],
                                                )
                                              ],
                                            ),
                                            20.height,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: screenWidth * 0.6,
                                                  height: 40,
                                                  alignment: Alignment.center,
                                                  padding:
                                                      EdgeInsets.only(left: 15),
                                                  decoration: BoxDecoration(
                                                      border: Border(
                                                          top: BorderSide(
                                                              color: Color(
                                                                  0xFFD9D9D9),
                                                              width: 1.0),
                                                          left: BorderSide(
                                                              color: Color(
                                                                  0xFFD9D9D9),
                                                              width: 3.0))),
                                                  child: Text(
                                                    'これを見た人はこれも見ています',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                )
                                              ],
                                            ),
                                            20.height,
                                            Row(
                                              children: [
                                                CustomPage(
                                                  dotscount: 5,
                                                  pageInserts: [
                                                    SelectCard(
                                                        choice: choices[0]),
                                                    SelectCard(
                                                        choice: choices[1]),
                                                    SelectCard(
                                                        choice: choices[2]),
                                                    SelectCard(
                                                        choice: choices[3]),
                                                    SelectCard(
                                                        choice: choices[4]),
                                                  ],
                                                  currentPage: 0,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        SizedBox(
                                            width: 107,
                                            height: 40,
                                            child: Stack(
                                              children: [
                                                OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                ShopPage3()));
                                                  },
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xFF555555),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        ' カートを見る',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                            width: 155,
                                            height: 40,
                                            child: Stack(
                                              children: [
                                                OutlinedButton(
                                                  onPressed: () {},
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    backgroundColor:
                                                        Color(0xFF555555)
                                                            .withOpacity(0.3),
                                                    side: BorderSide(
                                                        color:
                                                            Colors.transparent),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        ' ショッピングを続ける',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    );
                                  });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Color(0xFF555555),
                              side: BorderSide(color: Colors.transparent),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/shopping.svg',
                                  width: 20,
                                ),
                                Text(
                                  ' カートに入れる',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.7,
                    child: Text(
                      '返品について',
                    ),
                  )
                ],
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 30,
                      child: Stack(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.black, width: 1.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                    'assets/images/r_mail.png',
                                  ),
                                  color: Colors.black,
                                  width: 20,
                                ),
                                Text(
                                  ' この商品について問合せる',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Color(0xFFD9D9D9), width: 3.0))),
                    child: Text(
                      '商品説明',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'degimeカードは専用アプリと連携すると、スマホに近づけるだけでそのスマホにデジタル名刺を表示させることができます。',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: screenWidth,
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05 + 15, top: 20),
                      child: RichText(
                          text: TextSpan(
                              text: '特定商取引法に基づく表示   |   プライバシーポリシー\n',
                              style: TextStyle(
                                color: Color(0xFF4C31F4),
                              ),
                              children: [
                            TextSpan(
                                text:
                                    'Copyright ©degimeカード All Rights Reserved.',
                                style: TextStyle(color: Colors.black))
                          ])))
                ],
              ),
            ],
          ),
        ));
  }
}

class CustomPage extends StatefulWidget {
  CustomPage(
      {this.onPress,
      this.currentPage,
      this.dotscount,
      this.pageInserts,
      super.key});
  List<Widget>? pageInserts;
  int? dotscount;
  double? currentPage;
  final Function()? onPress;
  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: widget.currentPage!.toInt(), viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 220,
        color: Colors.grey.withOpacity(0.4),
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
                        child: Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: widget.pageInserts![i],
                    ))
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: widget.dotscount!,
              position: widget.currentPage!.toInt(),
              decorator: DotsDecorator(
                activeColor: Colors.white,
                color: Colors.black,
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

class Choice {
  const Choice(
      {required this.title,
      required this.price,
      required this.id,
      required this.assetImage});
  final String title;
  final String id;
  final String price;
  final String assetImage;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'degimeカード',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード1',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード2',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード3',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード4',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード5',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード6',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
  const Choice(
      title: 'degimeカード7',
      assetImage: 'assets/images/nfccard.png',
      id: 'A000000001',
      price: '3300円'),
];

class SelectCard extends StatelessWidget {
  const SelectCard({super.key, required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        color: Colors.white,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 110,
                    height: 110,
                    child: IconButton(
                      icon: Image(
                        image: AssetImage(choice.assetImage),
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ShopPage2()));
                      },
                    )),
                Text(
                  choice.id,
                  style: TextStyle(fontSize: 14),
                ),
                Text(choice.title, style: TextStyle(fontSize: 16)),
                Text(
                  choice.price,
                  style: TextStyle(color: Colors.red, fontSize: 16),
                )
              ]),
        ));
  }
}
