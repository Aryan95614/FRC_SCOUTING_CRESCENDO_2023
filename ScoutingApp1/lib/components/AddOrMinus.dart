import './functions.dart';
import 'package:flutter/material.dart';

class AddOrMinus extends StatefulWidget {
  AddOrMinus({Key? key, required this.value, required this.description})
      : super(key: key);

  String value;
  final String description;

  @override
  _AddOrMinusState createState() => _AddOrMinusState();
}

class _AddOrMinusState extends State<AddOrMinus> {
  @override
  Widget build(BuildContext context) {
    return coolButton(widget.value, widget.description);
  }

  Row coolButton(String value, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${widget.description} "),
        Functions.widthSpacing(),
        Container(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (Functions.dataclass.data[widget.value] > 0) {
                    Functions.dataclass.data[widget.value] -= 1;
                  }
                });
              },
              child: const Text(
                "-",
              )),
        ),

        // Adding some space
        Functions.widthSpacing(),

        // Icon to show information
        Text('${Functions.dataclass.data[widget.value]}'),

        // Adding some space
        Functions.widthSpacing(),

        Container(
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (Functions.dataclass.data[widget.value] < 50) {
                    Functions.dataclass.data[widget.value] += 1;
                  }
                });
              },
              child: const Text(
                "+",
              )),
        ),
      ],
    );
  }
}
