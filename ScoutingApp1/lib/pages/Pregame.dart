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
  final PageStorageBucket _bucket = PageStorageBucket();

  textBoxField personName =
      textBoxField(value: "person_name", description: "Your name?");
  textBoxField teamNumber =
      textBoxField(value: "team_name", description: "Team #?:");
  textBoxField matchNumber =
      textBoxField(value: "match_number", description: "Match #?:");

  checkbox isRed = checkbox(value: "color", description: "Team red?");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              personName,
              Functions.verticalSpacing(),

              teamNumber,
              Functions.verticalSpacing(),

              matchNumber,
              Functions.verticalSpacing(),

              isRed,
              Functions.verticalSpacing(),

              // Page Navigation
              backAndForthPages(context, 2),
            ],
          ),
        ));
  }
}
