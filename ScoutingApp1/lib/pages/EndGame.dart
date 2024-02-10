import 'package:flutter/material.dart';
import '../components/functions.dart';

class Dataclass {}

class EndGamePage extends StatefulWidget {
  const EndGamePage({super.key, required this.title});

  final String title;

  @override
  State<EndGamePage> createState() => _EndGamePageState();
}

class _EndGamePageState extends State<EndGamePage> {
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
                    const Text('Climb'),
                      Checkbox(value: functions.dataclass.climb, onChanged: (bool? button) {setState(() {
                        functions.dataclass.climb = button!;
                      });}),
                      const Text('Trap'),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            OutlinedButton(
                                onPressed: () {
                                  if (functions.dataclass.trap >= 1){
                                    setState(() {
                                      functions.dataclass.trap -= 1;
                                    });}
                                },
                                child: const Text('-')),
                            const SizedBox(width: 20,),
                            Text('${functions.dataclass.trap}'),
                            const SizedBox(width: 20,),
                            OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    functions.dataclass.trap += 1;
                                  });
                                },
                                child: const Text('+')),
                          ]),
                      const Text('Fell off chain'),
                      Checkbox(value: functions.dataclass.fall, onChanged: (bool? button) {setState(() {
                        functions.dataclass.fall = button!;
                      });}),
                      const Text('Harmonized'),
                      const Row(                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('1'),
                          SizedBox(width: 52,),
                          Text('2'),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Checkbox(
                                value: functions.dataclass.harmonize1,
                                onChanged: (bool? button) {
                                  if (functions.dataclass.harmonize2 = false) {
                                    setState(() {
                                      functions.dataclass.harmonize1 =
                                      button!;
                                    });
                                  } else {
                                    setState(() {
                                      functions.dataclass.harmonize1 =
                                      button!;
                                      functions.dataclass.harmonize2 = false;
                                    });
                                  }
                                }),
                            const SizedBox(
                              height: 1,
                              width: 30,
                            ),
                            Checkbox(
                                value: functions.dataclass.harmonize2,
                                onChanged: (bool? button) {
                                  if (functions.dataclass.harmonize1 =
                                  false) {
                                    setState(() {
                                      functions.dataclass.harmonize2 = button!;
                                    });
                                  } else {
                                    setState(() {
                                      functions.dataclass.harmonize2 = button!;
                                      functions.dataclass.harmonize1 = false;
                                    });
                                  }
                                }),
                          ]),
                      const SizedBox(height: 175,),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/PostGame');
                        },
                        child: const Text("Next"),
                      ),
                      SizedBox(height: 15,),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/Teleop');
                        },
                        child: const Text("Back"),
                      ),
                    ]
                ))));}}