import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:todo_speech/write.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenContainer(
          transitionDuration: const Duration(milliseconds: 500),
          closedBuilder: (BuildContext _, VoidCallback openContainer) {
            return Container(
              width: 80,
              height: 80,
              child: ElevatedButton(
                onPressed: openContainer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2), // 각진 네모 모양으로 설정
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            );
          },
          openBuilder: (BuildContext _, VoidCallback closeContainer) {
            return Write();
          },
        ),
      ),
    );
  }
}
