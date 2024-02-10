import 'package:flutter/material.dart';
import '../components/functions.dart';

class Dataclass {}

class PregamePage extends StatefulWidget {
  const PregamePage({super.key, required this.title});

  final String title;

  @override
  State<PregamePage> createState() => _PregamePageState();
}

class _PregamePageState extends State<PregamePage> {
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
                const Text('First Name Last Initial'),
                SizedBox(
                    height: 34,
                    width: 100,
                    child: TextField(onChanged: (String inputValue) {
                      functions.dataclass.name = inputValue;
                    })),
                const SizedBox(
                  height: 25,
                ),
                const Text('Team Name'),
                SizedBox(
                    height: 34,
                    width: 100,
                    child: TextField(onChanged: (String inputValue) {
                      functions.dataclass.team_name = inputValue;
                    })),
                const SizedBox(
                  height: 25,
                ),
                const Text('Team Number'),
                SizedBox(
                    height: 34,
                    width: 100,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (String inputValue) {
                          functions.dataclass.team_number = inputValue;
                        })),
                const SizedBox(
                  height: 25,
                  width: 1,
                ),
                const Text('Match Number'),
                SizedBox(
                    height: 34,
                    width: 100,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (String inputValue) {
                          functions.dataclass.match_number = inputValue;
                        })),
                const SizedBox(
                  height: 25,
                  width: 1,
                ),
                //put number exclusive text field here
                const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Red team?'),
                      SizedBox(
                        height: 1,
                        width: 25,
                      ),
                      Text('Blue team?'),
                    ]),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: functions.dataclass.bogusshitdontcount,
                          onChanged: (bool? button) {
                            if (functions.dataclass.color = false) {
                              setState(() {
                                functions.dataclass.bogusshitdontcount =
                                    button!;
                              });
                            } else {
                              setState(() {
                                functions.dataclass.bogusshitdontcount =
                                    button!;
                                functions.dataclass.color = false;
                              });
                            }
                          }),
                      const SizedBox(
                        height: 1,
                        width: 67,
                      ),
                      Checkbox(
                          value: functions.dataclass.color,
                          onChanged: (bool? button) {
                            if (functions.dataclass.bogusshitdontcount =
                                false) {
                              setState(() {
                                functions.dataclass.color = button!;
                              });
                            } else {
                              setState(() {
                                functions.dataclass.color = button!;
                                functions.dataclass.bogusshitdontcount = false;
                              });
                            }
                          }),
                    ]),
                const SizedBox(
                  height: 25,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Auto');
                  },
                  child: const Text("Next"),
                ),
                const SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/MyHomePage');
                  },
                  child: const Text("Cancel"),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
  }
}
