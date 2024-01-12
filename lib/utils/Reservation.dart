import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:intl/intl.dart';

class Reservation extends StatefulWidget {
  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  void _showCalendarDialog1() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2023, 12, 31),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        _controller1.text = DateFormat.yMd().format(selectedDate!);
      });
      _showTimePickerDialog1();
    }
  }

  void _showCalendarDialog2() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023, 1, 1),
      lastDate: DateTime(2023, 12, 31),
    );

    if (pickedDate != null) {
      //_showTimePickerDialog();
      setState(() {
        selectedDate = pickedDate;
        _controller2.text = DateFormat.yMd().format(selectedDate!);
      });
      _showTimePickerDialog2();
    }
  }

  void _showTimePickerDialog1() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        _controller1.text =
            _controller1.text + " " + selectedTime.toString().substring(10, 15);
      });
    }
  }

  void _showTimePickerDialog2() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        _controller2.text =
            _controller2.text + " " + selectedTime.toString().substring(10, 15);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        '予約設定',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('公開日時'),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 40,
                child: TextField(
                    controller: _controller1,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: '月/日/年 --:--',
                      contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_month),
                        onPressed: _showCalendarDialog1,
                      ),
                    ))),
            40.height,
            Text('終了日時'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
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
      ),
      actions: [
        SizedBox(
          width: 120,
          height: 30,
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.green,
                side: BorderSide.none,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                'すぐに予約する',
                style: TextStyle(color: Colors.white),
              )),
        ),
        SizedBox(
          width: 120,
          height: 30,
          child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                side: BorderSide.none,
                padding: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text(
                '予約を設定',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ],
    );
  }
}
