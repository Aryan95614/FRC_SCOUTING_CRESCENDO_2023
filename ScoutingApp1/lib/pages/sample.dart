import 'package:flutter/material.dart';

class beginning extends StatefulWidget {
  const beginning({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<beginning> createState() => _beginningState();
}

class _beginningState extends State<beginning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
