import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/controller.dart';

class Note extends StatefulWidget {
  Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("흰둥이");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Note"),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            setState(() {

                            });
                            todos.add(input);
                            Get.back();
                          },
                          child: Text("등록")),
                      TextButton(
                          onPressed: () {
                            Get.back(); // 닫기
                          },
                          child: Text("닫기")),
                    ]);
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                // 삭제 버튼 및 기능 추가
                key: Key(todos[index]),
                child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          }),
                    )));
          }),
    );
  }
}
