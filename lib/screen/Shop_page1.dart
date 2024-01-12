import 'package:degime_131/screen/Shop_page2.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ShopPage1 extends StatefulWidget {
  @override
  State<ShopPage1> createState() => _ShopPage1();
}

class _ShopPage1 extends State<ShopPage1> {
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
            CustomPage(
              dotscount: 5,
              pageInserts: [
                Image(image: AssetImage('assets/images/degime1.png')),
                Image(image: AssetImage('assets/images/degime1.png')),
                Image(image: AssetImage('assets/images/degime1.png')),
                Image(image: AssetImage('assets/images/degime1.png')),
                Image(image: AssetImage('assets/images/degime1.png')),
              ],
              currentPage: 0,
            ),
            30.height,
            Container(
                width: screenWidth,
                height: screenWidth + 30,
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(choices.length, (index) {
                      return Center(
                        child: SelectCard(choice: choices[index]),
                      );
                    })))
          ],
        ),
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
        width: MediaQuery.of(context).size.width,
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
