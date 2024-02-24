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
  AddOrMinus trapsMissed =
      AddOrMinus(value: "trap_miss", description: "Traps Missed: ");
  AddOrMinus fouls = AddOrMinus(
      value: "fouls", description: "Foul points given to other team: ");
  AddOrMinus cards = AddOrMinus(value: "cards", description: "Card issued: ");

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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Did it climb?    "),
                Checkbox(
                    value: Functions.dataclass.climbed,
                    onChanged: (bool? moved) {
                      setState(() {
                        Functions.dataclass.climbed = moved!;
                      });
                    }),
              ]),
              Functions.verticalSpacing(),

              // Has the robot moved ( CheckBox )
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Did it fall?  "),
                  Checkbox(
                      value: Functions.dataclass.chainFalling,
                      onChanged: (bool? moved) {
                        setState(() {
                          Functions.dataclass.chainFalling = moved!;
                        });
                      }),
                ],
              ),

              Functions.verticalSpacing(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Did it score a trap?   "),
                  Checkbox(
                      value: Functions.dataclass.traps,
                      onChanged: (bool? moved) {
                        setState(() {
                          Functions.dataclass.traps = moved!;
                        });
                      }),
                ],
              ),

              Functions.verticalSpacing(),

              trapsMissed,
              Functions.verticalSpacing(),

              // harmonize two bullets
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Has it harmonized with 1 robots:   "),
                  Checkbox(
                      value: Functions.dataclass.harmonize_two,
                      onChanged: (bool? moved) {
                        setState(() {
                          Functions.dataclass.harmonize_two = moved!;
                        });
                      }),
                ],
              ),

              Functions.verticalSpacing(),

              // harmonize three
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Has it harmonized with 2 robots:   "),
                  Checkbox(
                      value: Functions.dataclass.harmonize_three,
                      onChanged: (bool? moved) {
                        setState(() {
                          Functions.dataclass.harmonize_three = moved!;
                        });
                      }),
                ],
              ),

              Functions.verticalSpacing(),

              // notes on the robot
              notes,
              Functions.verticalSpacing(),

              fouls,
              Functions.verticalSpacing(),

              cards,
              Functions.verticalSpacing(),
              const Text(
                  " FYI: The Yellow Card is 1, The Red is 2. Otherwise it is 0."),

              Functions.verticalSpacing(),
              // Page Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/TeleopPage");
                      },
                      icon: const Icon(Icons.arrow_back_outlined)),
                  Functions.widthSpacing(),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/PostGamePage");
                      },
                      icon: const Icon(Icons.arrow_forward_outlined))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
