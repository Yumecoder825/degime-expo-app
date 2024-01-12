import 'package:degime_131/screen/Shop_page3.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ShopPage4 extends StatefulWidget {
  @override
  State<ShopPage4> createState() => _ShopPage4();
}

class _ShopPage4 extends State<ShopPage4> {
  Widget SalesCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 150,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage('assets/images/nfccard.png'),
            width: 150,
          ),
          20.width,
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'A000000002',
                style: TextStyle(fontSize: 14),
              ),
              Text('degimeカード２'),
              Text(
                '3,300円',
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              Text(
                '数量 : 1',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                '小計 : 3,300円 (税込)',
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
          10.width
        ],
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: screenWidth,
          leading: Image(image: AssetImage('assets/images/progress2.png')),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth,
                    alignment: Alignment.center,
                    child: Text(
                      '支払い方法',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  20.height,
                  SalesCard(context),
                  20.height,
                  SalesCard(context),
                  20.height,
                  SalesCard(context),
                  20.height,
                  Container(
                    margin: EdgeInsets.only(left: screenWidth * 0.05),
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            width: screenWidth * 0.9,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Text(
                              '商品合計',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            )),
                        Text(
                          '9,900円 (税込)',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        ),
                        Container(
                            width: screenWidth * 0.9,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Text(
                              '送料',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            )),
                        Text(
                          '0円 (税込)',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.right,
                        ),
                        Container(
                            width: screenWidth * 0.9,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Text(
                              '合計',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.right,
                            )),
                        Text(
                          '9,900円 (税込)',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5))),
                        ),
                        Text(
                          '(10%対象9,900円内消費税900円)',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  10.height,
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            alignment: Alignment.center,
                            width: 35,
                            height: 18,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red),
                            child: Text(
                              '必須',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )),
                        Text(
                          'は必須項目です',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        width: screenWidth * 0.9,
                        height: 40,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(color: Color(0xFFBBCCDD)),
                        child: Text(
                          'お支払方法',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  20.height,
                  Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05),
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 1.0))),
                    child: Text(
                        'お支払い方法が設定されていないため、購入することができません。\nお手数ですが店舗までお問い合わせください。'),
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              child: Text('最終確認へ'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF333333)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            right: 10,
                            child: SvgPicture.asset(
                              'assets/images/rightarrow.svg',
                              width: 8,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ShopPage3()));
                          },
                          child: Text('前の画面へ戻る'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF696969)),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
