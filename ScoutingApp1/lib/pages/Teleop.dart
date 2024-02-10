import 'package:flutter/material.dart';
import '../components/functions.dart';

class Dataclass {}

class TelePage extends StatefulWidget {
  const TelePage({super.key, required this.title});

  final String title;

  @override
  State<TelePage> createState() => _TelePageState();
}

class _TelePageState extends State<TelePage> {
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
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Notes in Speaker'),
                          ]
                    ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    OutlinedButton(
                        onPressed: () {
                          if (functions.dataclass.speaker >= 1){
                          setState(() {
                            functions.dataclass.speaker -= 1;
                          });}
                        },
                        child: const Text('-')),
                    const SizedBox(width: 20,),
                    Text('${functions.dataclass.speaker}'),
                    const SizedBox(width: 20,),
                    OutlinedButton(
                        onPressed: () {
                          setState(() {
                            functions.dataclass.speaker += 1;
                          });
                        },
                        child: const Text('+')),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Missed Speaker Notes'),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                    onPressed: () {
                      if (functions.dataclass.missedSpeaker >= 1){
                        setState(() {
                          functions.dataclass.missedSpeaker -= 1;
                        });}
                    },
                    child: const Text('-')),
                const SizedBox(width: 20,),
                Text('${functions.dataclass.missedSpeaker}'),
                const SizedBox(width: 20,),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        functions.dataclass.missedSpeaker += 1;
                      });
                    },
                    child: const Text('+')),
              ],),
                  const SizedBox(
                    height: 15,
                  ),
              const Text('Notes in Amp'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                            onPressed: () {
                              if (functions.dataclass.amp >= 1){
                                setState(() {
                                  functions.dataclass.amp -= 1;
                                });}
                            },
                            child: const Text('-')),
                        const SizedBox(width: 20,),
                        Text('${functions.dataclass.amp}'),
                        const SizedBox(width: 20,),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                functions.dataclass.amp += 1;
                              });
                            },
                            child: const Text('+')),
                      ]),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text('Missed Amp Notes'),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OutlinedButton(
                          onPressed: () {
                            if (functions.dataclass.missedAmp >= 1){
                              setState(() {
                                functions.dataclass.missedAmp -= 1;
                              });}
                          },
                          child: const Text('-')),
                      const SizedBox(width: 20,),
                      Text('${functions.dataclass.missedAmp}'),
                      const SizedBox(width: 20,),
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              functions.dataclass.missedAmp += 1;
                            });
                          },
                          child: const Text('+')),
                    ],),
                  const SizedBox(
                    height: 15,
                  ),
              const Text('Coop Bonus'),
                  Checkbox(
                      value: functions.dataclass.coop_bonus,
                      onChanged: (bool? button) {
                          setState(() {
                            functions.dataclass.coop_bonus = button!;
                          });
                        }
                      ),
                  const SizedBox(
                    height: 15,
                  ),
              const Text('Breakdowns'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                            onPressed: () {
                              if (functions.dataclass.breakdown >= 1){
                                setState(() {
                                  functions.dataclass.breakdown -= 1;
                                });}
                            },
                            child: const Text('-')),
                        const SizedBox(width: 20,),
                        Text('${functions.dataclass.breakdown}'),
                        const SizedBox(width: 20,),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                functions.dataclass.breakdown += 1;
                              });
                            },
                            child: const Text('+')),
                      ]),
                  const SizedBox(
                    height: 15,
                  ),
              const Text('Recoveries'),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        OutlinedButton(
                            onPressed: () {
                              if (functions.dataclass.recovery >= 1){
                                setState(() {
                                  functions.dataclass.recovery -= 1;
                                });}
                            },
                            child: const Text('-')),
                        const SizedBox(width: 20,),
                        Text('${functions.dataclass.recovery}'),
                        const SizedBox(width: 20,),
                        OutlinedButton(
                            onPressed: () {
                              setState(() {
                                functions.dataclass.recovery += 1;
                              });
                            },
                            child: const Text('+')),
                      ]),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(height: 55,),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/EndGame');
                    },

                    child: const Text("Next"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/Auto');
                    },

                    child: const Text("Back"),
                  ),
            ])),
      ),
    );
  }
}
