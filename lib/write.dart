import 'package:flutter/material.dart';

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white,), onPressed: () { Navigator.of(context).pop(); },
        ),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
