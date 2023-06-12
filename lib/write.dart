import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  DateTime? _selectedDate = null;

  final todoController = TextEditingController();

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: '할 일'),
              controller: todoController,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.utc(2030, 3, 14),
                ).then((selectedDate) {
                  setState(() {
                    _selectedDate = selectedDate;
                  });
                });
              },
              child: const Text("날짜 선택"),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,0,8,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    _selectedDate != null
                        ? _selectedDate.toString().split(" ")[0]
                        : "날짜가 아직 선택되지 않음",
                    style: const TextStyle(fontSize: 22)),
                if (_selectedDate != null)
                  Text(
                    "D - ${daysBetween(DateTime.now(), _selectedDate!)}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )
              ],
            ),
          ),
          const SizedBox(height: 180),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,20,0),
                child: TextButton(onPressed: () {}, child: Text("등록", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blueAccent),)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,20,0),
                child: TextButton(onPressed: () {}, child: Text("취소", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.blueAccent),)),
              ),
            ],
          )
        ],
      )),
      bottomNavigationBar: ConvexButton.fab(
        // 음성인식
        onTap: () => setState(() => {}),
      ),
    );
  }
}
