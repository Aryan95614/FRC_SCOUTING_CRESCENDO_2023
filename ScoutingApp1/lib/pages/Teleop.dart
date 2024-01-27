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

  checkbox coopBonus = checkbox(value: "coop", description: "Coop bonus?: ");
  AddOrMinus recouvered =
      AddOrMinus(value: "recouver", description: "Recouvered: ");
  AddOrMinus brokedown = AddOrMinus(value: "broken", description: "Broken: ");

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
            coopBonus,
            Functions.verticalSpacing(),
            recouvered,
            Functions.verticalSpacing(),
            brokedown,
            Functions.verticalSpacing(),
            backAndForthPages(context, 4),
          ],
        ),
      )),
    );
  }
}
