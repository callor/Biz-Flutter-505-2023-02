import 'package:flutter/material.dart';
import 'package:flutter_member/screen/address.dart';
import 'package:intl/intl.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final _addrInputController = TextEditingController();
  final _dateInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("예약하기"),
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _addrInputController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "주소",
                suffix: IconButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddressPage(),
                        ),
                      );
                      _addrInputController.text = result["postCode"];
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
            TextFormField(
              controller: _dateInputController,
              decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: "일자",
                suffix: IconButton(
                    onPressed: () async {
                      final DateTime? selectDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      _dateInputController.text =
                          DateFormat('yyyy-MM-dd').format(DateTime(
                        selectDate!.year.toInt(),
                        selectDate.month.toInt(),
                        selectDate.day.toInt(),
                      ));
                      setState(() {});
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
