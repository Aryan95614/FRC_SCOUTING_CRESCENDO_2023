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

              const Text("Team Color: \t"),
              Functions.verticalSpacing(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Functions.widthSpacing(),
                  const Text("Red: "),
                  Checkbox(
                      value: Functions.dataclass.color,
                      activeColor: Colors.red,
                      onChanged: (bool? moved) {
                        setState(() {
                          Functions.dataclass.color = moved!;
                        });
                      }),
                  const Text("Blue: "),
                  Checkbox(
                      value: !Functions.dataclass.color,
                      activeColor: Colors.blue,
                      onChanged: (bool? moved) {
                        setState(() {
                          Functions.dataclass.color = !moved!;
                        });
                      }),
                ],
              ),

              Functions.verticalSpacing(),

              // Page Navigation
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/MainPage");
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
                Functions.widthSpacing(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/AutoPage");
                    },
                    icon: const Icon(Icons.arrow_forward_outlined))
              ]),
            ],
          ),
        ));
  }
}
