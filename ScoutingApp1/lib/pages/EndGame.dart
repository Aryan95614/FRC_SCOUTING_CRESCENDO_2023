import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scoutingapp1/components/AddOrMinus.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:scoutingapp1/components/Checkbox.dart';

class EndGame extends StatefulWidget {
  const EndGame({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EndGame> createState() => _EndGameState();
}

class _EndGameState extends State<EndGame> {
  checkbox climbed = new checkbox(value: "climb", description: "Climbed?: ");
  AddOrMinus trap =
      new AddOrMinus(value: "trap", description: "Traps Scored: ");

  checkbox chainFalling =
      new checkbox(value: "ChainFalling", description: "Fallen? ");

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
            ],
          ),
        ),
      ),
    );
  }
}
