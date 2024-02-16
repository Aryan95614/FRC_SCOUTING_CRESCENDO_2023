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
  checkbox trap = checkbox(value: "trap", description: "Traps Scored: ");

  AddOrMinus trapsMissed =
      AddOrMinus(value: "trap_miss", description: "Traps Missed: ");
  AddOrMinus fouls = AddOrMinus(
      value: "fouls", description: "Foul points given to other team: ");
  AddOrMinus cards =
      AddOrMinus(value: "cards", description: "Card Code Given: ");

  checkbox chainFalling =
      checkbox(value: "ChainFalling", description: "Fallen? ");

  checkbox harmonizeTwo = checkbox(
      value: "Harmonizing_Two_Robots",
      description: "Harmonize with one Robots?: ");
  checkbox harmonizeThree = checkbox(
      value: "Harmonizing_Three_Robots",
      description: "Harmonize with two robots?: ");

  textBoxField notes =
      textBoxField(value: 'notes', description: "Robot Info: ");

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

              // Has the robot moved ( CheckBox )
              chainFalling,
              Functions.verticalSpacing(),

              trap,
              Functions.verticalSpacing(),

              trapsMissed,
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

              fouls,
              Functions.verticalSpacing(),

              cards,
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
