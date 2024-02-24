import 'package:flutter/material.dart';

import 'package:scoutingapp1/components/AddOrMinus.dart';
import 'package:scoutingapp1/components/functions.dart';
import 'package:scoutingapp1/components/Checkbox.dart';

class TeleopPage extends StatefulWidget {
  const TeleopPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeleopPage> createState() => _TeleopPageState();
}

class _TeleopPageState extends State<TeleopPage> {
  AddOrMinus speakerNotes = AddOrMinus(
      value: "speaker_note_teleop", description: "Speaker Notes Scored: ");
  AddOrMinus speakerNotesMissed = AddOrMinus(
      value: "speaker_note_missed", description: "Speaker Notes Missed: ");

  AddOrMinus ampNotes =
      AddOrMinus(value: "amp_note_teleop", description: "Amp Notes Scored: ");
  AddOrMinus ampNotesMissed =
      AddOrMinus(value: "amp_note_missed", description: "Amp Notes Missed: ");

  AddOrMinus recouvered =
      AddOrMinus(value: "recouver", description: "Recovered: ");
  AddOrMinus brokedown = AddOrMinus(value: "broken", description: "Broken: ");

  AddOrMinus timesAmped =
      AddOrMinus(value: "times_they_were_amped", description: "Times Amped: ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            speakerNotes,
            Functions.verticalSpacing(),
            speakerNotesMissed,
            Functions.verticalSpacing(),
            ampNotes,
            Functions.verticalSpacing(),
            ampNotesMissed,
            Functions.verticalSpacing(),
            timesAmped,
            Functions.verticalSpacing(),

            // coop bonus
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Coop Bonus?   "),
              Checkbox(
                  value: Functions.dataclass.coop_bonus,
                  onChanged: (bool? moved) {
                    setState(() {
                      Functions.dataclass.coop_bonus = moved!;
                    });
                  })
            ]),
            Functions.verticalSpacing(),
            recouvered,
            Functions.verticalSpacing(),
            brokedown,
            Functions.verticalSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/AutoPage");
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
                Functions.widthSpacing(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/EndGamePage");
                    },
                    icon: const Icon(Icons.arrow_forward_outlined))
              ],
            )
          ],
        ),
      )),
    );
  }
}
