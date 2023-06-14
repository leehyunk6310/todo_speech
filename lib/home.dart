import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_speech/write.dart';

import 'dto/dto.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<int, Todo>> todoList = [];


  @override
  void initState() {
    super.initState();
    openDB();
  }

  openDB() async {
    await Hive.initFlutter();
    if (Hive.isAdapterRegistered(0) == false)
      Hive.registerAdapter(TodoAdapter());

    var todoBox = await Hive.openBox<Todo>('todo');

    var keys = todoBox.keys;
    var values = todoBox.values;

    for (int i = 0; i < todoBox.length; i++) {
      todoList.add({keys.elementAt(i): values.elementAt(i)});
    }
    print(todoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) => OpenContainer(
                  transitionDuration: const Duration(milliseconds: 500),
                  closedBuilder: (BuildContext _,
                      VoidCallback openContainer) {
                    return ListTile(
                      tileColor: Colors.white12,
                      leading: Text('${todoList[index].values.first.content}', style: TextStyle(fontSize: 16),),
                      trailing: Text('D-${daysBetween(DateTime.now(), todoList[index].values.first.until!)}', style: TextStyle(color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold, fontSize: 24),),
                    );
                  },
                  openBuilder: (BuildContext _, VoidCallback closeContainer) {
                    return Write();
                  },
                ),
                separatorBuilder: (BuildContext context, int index) => Divider(
                      height: 10.0,
                      color: Colors.white30,
                    ),
                shrinkWrap: true,
                itemCount: todoList.length,

            ),
          ),


          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OpenContainer(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
