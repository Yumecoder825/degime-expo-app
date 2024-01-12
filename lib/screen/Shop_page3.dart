import 'package:degime_131/screen/Shop_page4.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class ShopPage3 extends StatefulWidget {
  @override
  State<ShopPage3> createState() => _ShopPage3();
}

class _ShopPage3 extends State<ShopPage3> {
  String selectedValue = "--都道府県--";
  Widget TextContainer(
      BuildContext context, String title, double ratio, int index) {
    return Container(
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: Colors.black, width: 1.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.height,
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      10.width,
                      index != 2
                          ? Container(
                              alignment: Alignment.center,
                              width: 35,
                              height: 18,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.red),
                              child: Text(
                                '必須',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ))
                          : 5.width
                    ],
                  ),
                ),
              ],
            ),
            10.height,
            index != 3
                ? Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width * ratio,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          child: index != 2
                              ? TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      hintText: index == 1 ? '012-3456' : '',
                                      contentPadding: EdgeInsets.all(0),
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.black))),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return '* 必須項目です';
                                    }
                                    return null;
                                  },
                                )
                              : TextFormField(
                                  style: TextStyle(fontSize: 20),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      fillColor: Colors.white,
                                      border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Colors.black))),
                                )),
                      10.width,
                      index == 1
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('住所取得'),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF333333)),
                                ),
                              ),
                            )
                          : 5.width
                    ],
                  )
                : Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: <String>[
                            '--都道府県--',
                            '北海道',
                            '青森県',
                            '岩手県',
                            '宮城県',
                            '秋田県',
                            '山形県',
                            '福島県',
                            '茨城県',
                            '栃木県',
                            '群馬県',
                            '埼玉県',
                            '千葉県',
                            '東京都',
                            '神奈川県',
                            '山梨県',
                            '長野県',
                            '新潟県',
                            '富山県',
                            '石川県',
                            '福井県',
                            '岐阜県',
                            '静岡県',
                            '愛知県',
                            '三重県',
                            '滋賀県',
                            '京都府',
                            '大阪府',
                            '兵庫県',
                            '奈良県',
                            '和歌山県',
                            '鳥取県',
                            '島根県',
                            '岡山県',
                            '広島県',
                            '山口県',
                            '徳島県',
                            '香川県',
                            '愛媛県',
                            '高知県',
                            '福岡県',
                            '佐賀県',
                            '長崎県',
                            '熊本県',
                            '大分県',
                            '宮崎県',
                            '鹿児島県',
                            '沖縄県',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              alignment: Alignment.center,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
            10.height
          ],
        ));
  }

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
          leading: Image(image: AssetImage('assets/images/progress1.png')),
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
                      'お客様情報',
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
                          'お客様情報',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  20.height,
                  TextContainer(context, 'お名前', 0.8, 0),
                  TextContainer(context, '郵便番号', 0.4, 1),
                  TextContainer(context, '都道府県', 0.4, 3),
                  TextContainer(context, '住所１', 0.8, 0),
                  TextContainer(context, '住所2', 0.8, 2),
                  TextContainer(context, 'メールアドレス', 0.8, 0),
                  TextContainer(context, '電話番号', 0.6, 0),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('お届け先を別で指定する'),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xFF333333)),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 15,
                            left: 30,
                            child: SvgPicture.asset(
                              'assets/images/leftcar.svg',
                              width: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  50.height,
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
                          'その他',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  20.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ご要望',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                                width: screenWidth - 40,
                                height: 200,
                                child: TextField(
                                  maxLines: 10,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          style: BorderStyle.solid,
                                          color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                )),
                            Text('(0/5,000文字)')
                          ],
                        ),
                      )
                    ],
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
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ShopPage4()));
                                }
                              },
                              child: Text('お支払方法へ'),
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
                          onPressed: () {},
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
