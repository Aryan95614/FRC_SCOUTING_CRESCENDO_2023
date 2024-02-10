import 'package:flutter/material.dart';
import '../components/functions.dart';

class Dataclass {}

class AutoGamePage extends StatefulWidget {
  const AutoGamePage({super.key, required this.title});

  final String title;

  @override
  State<AutoGamePage> createState() => _AutoPageState();
}

class _AutoPageState extends State<AutoGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              const Text('Notes in Speaker'),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton(
                                onPressed: () {
                                  if (functions.dataclass.speakerAuto >= 1) {
                                    setState(() {
                                      functions.dataclass.speakerAuto -= 1;
                                    });
                                  }
                                },
                                child: const Text('-')),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('${functions.dataclass.speakerAuto}'),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    functions.dataclass.speakerAuto += 1;
                                  });
                                },
                                child: const Text('+')),
                          ]),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('Missed Speaker Notes'),
                      //+/- buttons and counter
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton(
                                onPressed: () {
                                  if (functions.dataclass.missedSpeakerAuto >= 1) {
                                    setState(() {
                                      functions.dataclass.missedSpeakerAuto -= 1;
                                    });
                                  }
                                },
                                child: const Text('-')),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('${functions.dataclass.missedSpeakerAuto}'),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    functions.dataclass.missedSpeakerAuto += 1;
                                  });
                                },
                                child: const Text('+')),
                          ]),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('Notes in Amp'),
                      //+/- buttons and counter
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton(
                                onPressed: () {
                                  if (functions.dataclass.ampAuto >= 1) {
                                    setState(() {
                                      functions.dataclass.ampAuto -= 1;
                                    });
                                  }
                                },
                                child: const Text('-')),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('${functions.dataclass.ampAuto}'),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    functions.dataclass.ampAuto += 1;
                                  });
                                },
                                child: const Text('+')),
                          ]),
                      SizedBox(height: 20,),
                      const Text('Missed Amp Notes'),
                      //+/- buttons and counter
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton(
                                onPressed: () {
                                  if (functions.dataclass.missedAmpAuto >= 1) {
                                    setState(() {
                                      functions.dataclass.missedAmpAuto -= 1;
                                    });
                                  }
                                },
                                child: const Text('-')),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('${functions.dataclass.missedAmpAuto}'),
                            const SizedBox(
                              width: 20,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    functions.dataclass.missedAmpAuto += 1;
                                  });
                                },
                                child: const Text('+')),
                          ]),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('Moved'),
                      Checkbox(
                          value: functions.dataclass.moved,
                          onChanged: (bool? button) {
                            setState(() {
                              functions.dataclass.moved = button!;
                            });
                          }),
                      SizedBox(height: 37),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Teleop');
                        },
                        child: const Text("Next"),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Pregame');
                        },
                        child: const Text("Back"),
                      ),

                    ]))));
  }
}
