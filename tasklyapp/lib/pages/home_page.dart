import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tasklyapp/model/task.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHeight, _deviceWidth;

  String? _newTaskContent;

  Box? _box;
  _HomePageState();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Taskly!",
          style: TextStyle(fontSize: 25),
        ),
        toolbarHeight: _deviceHeight! * 0.15,
      ),
      body: _taskView(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskView() {
    return FutureBuilder(
      future: Hive.openBox("tasks"),
      builder: (BuildContext _context, AsyncSnapshot _snapShot) {
        if (_snapShot.hasData) {
          _box = _snapShot.data;
          return _taskList();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _taskList() {
    // Task _newask =
    //     Task(content: "Reading", timeStamp: DateTime.now(), done: false);
    // _box?.add(_newask.toMap());
    List tasks = _box!.values.toList();
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext _context, int index) {
          var task = Task.fromMap(tasks[index]);
          return ListTile(
            title: Text(
              task.content,
              style: TextStyle(
                  decoration: task.done ? TextDecoration.lineThrough : null),
            ),
            subtitle: Text(task.timeStamp.toString()),
            trailing: Icon(
              task.done
                  ? Icons.check_box_outlined
                  : Icons.check_box_outline_blank,
              color: Colors.red,
            ),
            onTap: () {
              task.done = !task.done;
              _box!.putAt(index, task.toMap());
              setState(() {});
            },
            onLongPress: () {
              _box!.deleteAt(index);
              setState(() {});
            },
          );
        });

    // ListView(
    //   children: <Widget>[
    //     ListTile(
    //       title: const Text(
    //         "Do Laundary",
    //         style: TextStyle(decoration: TextDecoration.lineThrough),
    //       ),
    //       subtitle: Text(DateTime.now().toString()),
    //       trailing: const Icon(
    //         Icons.check_box_outlined,
    //         color: Colors.red,
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      child: const Icon(Icons.add),
    );
  }

  void _displayTaskPopup() {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            title: const Text("Add New Task"),
            content: TextField(
              onSubmitted: (_) {
                if (_newTaskContent != null) {
                  var task = Task(
                      content: _newTaskContent!,
                      timeStamp: DateTime.now(),
                      done: false);
                  _box!.add(task.toMap());
                  setState(() {
                    _newTaskContent = null;
                    Navigator.pop(context);
                  });
                }
              },
              onChanged: (_value) {
                setState(() {
                  _newTaskContent = _value;
                });
              },
            ),
          );
        });
  }
}
