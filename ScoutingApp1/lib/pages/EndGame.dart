import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/AddOrMinus.dart';
import 'package:scoutingapp1/components/TextBoxField.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:scoutingapp1/components/Checkbox.dart';

class EndGame extends StatefulWidget {
  const EndGame({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EndGame> createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  checkbox climbed = checkbox(value: "climb", description: "Climbed?: ");
  AddOrMinus trap = AddOrMinus(value: "trap", description: "Traps Scored: ");

  checkbox chainFalling =
      checkbox(value: "ChainFalling", description: "Fallen? ");

  checkbox harmonizeTwo = checkbox(
      value: "Harmonizing_Two_Robots", description: "Harmonize two Robots?: ");
  checkbox harmonizeThree = checkbox(
      value: "Harmonizing_Three_Robots",
      description: "Harmonize three Robots?: ");

  textBoxField notes = textBoxField(
      value: 'notes', description: "Information about the Robot: ");

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
              // Speaker Note Score ( + - )
              climbed,
              Functions.verticalSpacing(),

              // Amp Note Score ( + - )
              trap,
              Functions.verticalSpacing(),

              // Has the robot moved ( CheckBox )
              chainFalling,
              Functions.verticalSpacing(),

              // harmonize two bullets
              harmonizeTwo,
              Functions.verticalSpacing(),

              // harmonize three
              harmonizeThree,
              Functions.verticalSpacing(),

              // notes on the robot
              notes,
              Functions.verticalSpacing(),

              // Page Navigation
              backAndForthPages(context, 5),
            ],
          ),
        ),
      ),
    );
  }
}
