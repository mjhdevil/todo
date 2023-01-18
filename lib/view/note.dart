import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/controller.dart';

class Note extends StatefulWidget {
  NoteController noteController = Get.put(NoteController());

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
        title: Text("mytodos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Add Todolist"),
                    content: TextField(
                      onChanged: (String value) {
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(onPressed: (){
                        setState(() {
                          if(TextField == context){ // 내용이 있어야 입력 수정해야함★★★
                            todos.add(input);
                            Navigator.of(context).pop(); // input 입력 후 창 닫히도록
                          }else{

                          }
                        });


                      },
                          child: Text("입력")),
                      TextButton(onPressed: (){
                        setState(() {
                        });
                        Get.back();	//
                      },
                          child: Text("닫기")),
                    ],
                );
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
            return Dismissible(	// 삭제 버튼 및 기능 추가
                key: Key(todos[index]),
                child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8), // 모든방향으로 여백
                    shape: RoundedRectangleBorder(borderRadius:
                    BorderRadius.circular(8)
                    ),
                    child: ListTile(
                      title: Text(todos[index]),
                      trailing: IconButton(icon: Icon(
                          Icons.delete,
                          color: Colors.red
                      ),
                          onPressed: () {
                            setState(() {
                              todos.removeAt(index);
                            });
                          }),
                    )
                ));
          }),
    );
  }
}
