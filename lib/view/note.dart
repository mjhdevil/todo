import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Note'),
      ),
    );
  }
}
