import 'package:flutter/material.dart';
import 'package:sample_project/utils/todo_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  final List toDoList = [
    ['Eat Sleep Repeat', false],
    ['Drink Cold Coffee', false],
  ];

  void checkboxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void SaveNewItems() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteItem(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Notes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkboxChanged(index),
              deleteFunction: (context) => deleteItem(index),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: "Add new items...",
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                        ),
                        borderRadius: BorderRadius.circular(20))),
              ),
            )),
            FloatingActionButton(
              onPressed: SaveNewItems,
              child: Icon(Icons.add,
              color: Colors.deepPurple,),
              mini: true,
              backgroundColor: Colors.deepPurple.shade200,
            ),
          ],
        ),
      ),
    );
  }
}
