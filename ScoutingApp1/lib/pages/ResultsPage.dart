import 'package:flutter/material.dart';
import '../components/functions.dart';

class Dataclass {}

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key, required this.title});

  final String title;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(widget.title),
    ),
    body: SingleChildScrollView(
    child: Center(child: Column(
    children: [
    const Text('RESULTS'),
      const Text('Auto-'),
      const Text('Name'),
      Text(functions.dataclass.name),
      const Text('Team Name'),
      Text(functions.dataclass.team_name),
      const Text('Team Number'),
      Text(functions.dataclass.team_number),
      const Text('Match Number'),
      Text(functions.dataclass.match_number),
      const Text('Blue?'),
      Text("${functions.dataclass.color}"),
      const Text('Auto'),
      const Text('Speaker Points in Auto'),
      Text("${functions.dataclass.speakerAuto}"),
      const Text('Amp Points in Auto'),
      Text("${functions.dataclass.ampAuto}"),
      const Text('Moved in auto'),
      Text("${functions.dataclass.moved}"),
      const Text('Teleop'),
      const Text('Speaker Points in Tele'),
      Text("${functions.dataclass.speaker}"),
      const Text('Amp Points in Tele'),
      Text("${functions.dataclass.amp}"),
      const Text('Coop bonus?'),
      Text("${functions.dataclass.coop_bonus}"),
      const Text('Breakdown'),
      Text("${functions.dataclass.breakdown}"),
      const Text('Recovery'),
      Text("${functions.dataclass.recovery}"),
      const Text('EndGame'),
      const Text('Climbed in endgame'),
      Text("${functions.dataclass.climb}"),
      const Text('Got Trap'),
      Text("${functions.dataclass.trap}"),
      const Text('Fell off chain'),
      Text("${functions.dataclass.fall}"),
      const Text('Harmonised 1'),
      Text("${functions.dataclass.harmonize1}"),
      const Text('Harmonized 2'),
      Text("${functions.dataclass.harmonize2}"),
      const Text('Postgame'),
      const Text('Fouls'),
      Text("${functions.dataclass.foul}"),
      const Text('Yellow Card?'),
      Text("${functions.dataclass.yellow_card}"),
      const Text('Red Card?'),
      Text("${functions.dataclass.red_card}"),
      const Text('Robot notes'),
      Text("${functions.dataclass.robot_notes}")
    ])),
    ),
    );
  }
}
