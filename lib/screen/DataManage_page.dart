import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';
import 'package:flutter_charts/flutter_charts.dart';

class DataManage extends StatefulWidget {
  @override
  State<DataManage> createState() => _DataManage();
}

class _DataManage extends State<DataManage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  DateTime? selectedDate;
  void _showCalendarDialog1() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2024, 12, 31),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        _controller1.text = DateFormat.yMd().format(selectedDate!);
      });
    }
  }

  void _showCalendarDialog2() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024, 1, 1),
      lastDate: DateTime(2024, 12, 31),
    );

    if (pickedDate != null) {
      //_showTimePickerDialog();
      setState(() {
        selectedDate = pickedDate;
        _controller2.text = DateFormat.yMd().format(selectedDate!);
      });
    }
  }

  Widget chartToRun() {
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();
    // Example shows an explicit use of the DefaultIterativeLabelLayoutStrategy.
    // The xContainerLabelLayoutStrategy, if set to null or not set at all,
    //   defaults to DefaultIterativeLabelLayoutStrategy
    // Clients can also create their own LayoutStrategy.
    xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
      options: chartOptions,
    );
    chartData = ChartData(
      dataRows: const [
        [10.0, 20.0, 5.0, 30.0, 5.0, 20.0, 10.0, 20.0, 5.0, 30.0, 5.0, 20.0],
        [
          30.0,
          60.0,
          16.0,
          100.0,
          12.0,
          120.0,
          30.0,
          60.0,
          16.0,
          100.0,
          12.0,
          120.0,
        ],
      ],
      xUserLabels: const [
        '1',
        '2',
        '3',
        '4',
        '5',
        '6',
        '7',
        '8',
        '9',
        '10',
        '11',
        '12'
      ],
      dataRowsLegends: const [
        'Sp',
        'Su',
      ],
      chartOptions: chartOptions,
    );
    // chartData.dataRowsDefaultColors(); // if not set, called in constructor
    var lineChartContainer = LineChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var lineChart = LineChart(
      painter: LineChartPainter(
        lineChartContainer: lineChartContainer,
      ),
    );
    return lineChart;
  }

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
                children: [
                  Container(
                    width: screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 4,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: screenWidth * 0.31,
                            height: screenWidth * 0.31,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '月間訪問者数',
                                  style: TextStyle(fontSize: 16),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '135',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 20),
                                      children: [
                                        TextSpan(
                                            text: '人',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14))
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '前日比：',
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: '＋25',
                                            style:
                                                TextStyle(color: Colors.blue))
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: screenWidth * 0.31,
                            height: screenWidth * 0.31,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '平均滞在時間',
                                  style: TextStyle(fontSize: 16),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '126',
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 20),
                                      children: [
                                        TextSpan(
                                            text: '分/人',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14))
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '前日比：',
                                      style: TextStyle(color: Colors.white),
                                      children: [
                                        TextSpan(
                                            text: '＋25',
                                            style:
                                                TextStyle(color: Colors.white))
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            width: screenWidth * 0.31,
                            height: screenWidth * 0.31,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '月間訪問者数',
                                  style: TextStyle(fontSize: 16),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '456',
                                      style: TextStyle(
                                          color: Colors.orange, fontSize: 20),
                                      children: [
                                        TextSpan(
                                            text: '人',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14))
                                      ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: '前日比：',
                                      style: TextStyle(color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: '＋3',
                                            style:
                                                TextStyle(color: Colors.blue))
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: TextField(
                          controller: _controller1,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: '月/日/年 --:--',
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.calendar_month),
                              onPressed: _showCalendarDialog1,
                            ),
                          ))),
                  Text(
                    '~',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 40,
                    child: TextField(
                      controller: _controller2,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: '月/日/年 --:--',
                          contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_month),
                            onPressed: _showCalendarDialog2,
                          )),
                    ),
                  ),
                ],
              ),
              20.height,
              Row(
                children: [
                  Container(
                    width: screenWidth,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: const Color(0xFFFF8F61)
                                        .withOpacity(0.6),
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "日別",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            SizedBox(
                                width: 150,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: const Color(0xFF2AC3FF),
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "月間",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: screenWidth,
                              height: screenWidth,
                              child: chartToRun(),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              20.height,
              Row(
                children: [
                  Container(
                    width: screenWidth,
                    alignment: Alignment.center,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Month')),
                        DataColumn(
                            label: Text(
                          '月間\n訪問数',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        )),
                        DataColumn(
                          label: Text(
                            '月間\n交換者数',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('2023-01')),
                          DataCell(Text('500')),
                          DataCell(Text('500')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('2023-02')),
                          DataCell(Text('200')),
                          DataCell(Text('200')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('2023-03')),
                          DataCell(Text('900')),
                          DataCell(Text('900')),
                        ]),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
