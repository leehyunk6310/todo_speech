import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_speech/calendar.dart';
import 'package:todo_speech/weekly.dart';
import 'package:todo_speech/write.dart';
import 'done.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)),
      home: const MyHomePage(title: 'Todo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildConvexAppBar(),
      body: _widgetOptions[_selectedIndex],
    );
  }

  ConvexAppBar buildConvexAppBar() {
    return ConvexAppBar(
      items: const [
        TabItem(
          icon: Icon(
            Icons.home,
          ),
        ),
        TabItem(
          icon: Icon(
            Icons.calendar_month,
          ),
        ),
        TabItem(
          icon: Icon(
            Icons.star,
          ),
        ),
        TabItem(
          icon: Icon(
            Icons.download_done,
          ),
        ),
      ],
      onTap: (index) {
        //Handle button tap
        _onItemTapped(index);
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
        _selectedIndex = index;
    });
  }

  CurvedNavigationBar buildCurvedNavigationBar() {
    return CurvedNavigationBar(
      backgroundColor: Colors.blueAccent,
      index: _selectedIndex,
      height: 50,
      animationDuration: const Duration(milliseconds: 150),
      items: const <Widget>[
        Icon(
          Icons.home,
        ),
        Icon(
          Icons.calendar_month,
        ),
        Icon(
          Icons.star,
        ),
        Icon(
          Icons.download_done,
        ),
      ],
      onTap: (index) {
        //Handle button tap
        _onItemTapped(index);
      },
    );
  }
}

final List<Widget> _widgetOptions = <Widget>[
  Home(),
  Calendar(),
  Weekly(),
  Done()
];
