import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/AddOrMinus.dart';
import 'package:scoutingapp1/components/TextBoxField.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:scoutingapp1/components/Checkbox.dart';

class Pregame extends StatefulWidget {
  const Pregame({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Pregame> createState() => _PregameState();
}

class _PregameState extends State<Pregame> {
  textBoxField personName =
      new textBoxField(value: "person_name", description: "Your name?");
  checkbox isRed = new checkbox(value: "color", description: "Team red?");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        dragStartBehavior: DragStartBehavior.start,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              personName,
              Functions.verticalSpacing(),
              isRed,
            ],
          ),
        ),
      ),
    );
  }
}
