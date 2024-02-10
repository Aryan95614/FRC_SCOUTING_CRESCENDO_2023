import 'package:flutter/material.dart';
import '../components/functions.dart';

class Dataclass {}

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.title});

  final String title;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
            const Text('Fouls'),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                      onPressed: () {
                        if (functions.dataclass.foul >= 1){
                          setState(() {
                            functions.dataclass.foul -= 1;
                          });}
                      },
                      child: const Text('-')),
                  const SizedBox(width: 20,),
                  Text('${functions.dataclass.foul}'),
                  const SizedBox(width: 20,),
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          functions.dataclass.foul += 1;
                        });
                      },
                      child: const Text('+')),
                ]),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ Text('Yellow Card?'),
                  SizedBox(
                    height: 1,
                    width: 25,
                  ),
                  Text('Red Card?'),]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Checkbox(
                      value: functions.dataclass.yellow_card,
                      onChanged: (bool? button) {
                        if (functions.dataclass.red_card = false){
                          setState(() {
                            functions.dataclass.yellow_card = button!;
                          });}
                        else{
                          setState(() {
                            functions.dataclass.yellow_card = button!;
                            functions.dataclass.red_card = false;
                          });
                        }
                      }),
                  const SizedBox(
                    height:1,
                    width:67,
                  ),
                  Checkbox(
                      value: functions.dataclass.red_card,
                      onChanged: (bool? button) {
                        if (functions.dataclass.yellow_card = false){
                          setState(() {
                            functions.dataclass.red_card = button!;
                          });}
                        else{
                          setState(() {
                            functions.dataclass.red_card = button!;
                            functions.dataclass.yellow_card = false;
                          });
                        }
                      }),



                ]),
            const SizedBox(
              height: 15,
            ),
            const Text('Information about the Robot'),
            SizedBox(
                height: 34,
                width: 300,
                child: TextField(onChanged: (String inputValue) {
                  functions.dataclass.robot_notes  = inputValue;
                })),
            const SizedBox(height: 230,),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ResultsPage');
              },

              child: const Text("Finish"),
            ),
            SizedBox(height: 15,),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/EndGame');
              },
              child: const Text("Back"),
            ),
          ],
        )),
      ),
    );
  }
}
