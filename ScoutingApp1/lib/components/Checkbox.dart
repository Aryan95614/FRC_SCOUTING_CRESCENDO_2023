import './functions.dart';
import 'package:flutter/material.dart';

class checkbox extends StatefulWidget {
  checkbox({Key? key, required this.value, required this.description})
      : super(key: key);

  String value;
  final String description;

  @override
  _checkbox createState() => _checkbox();
}

class _checkbox extends State<checkbox> {
  @override
  Widget build(BuildContext context) {
    return coolCheckbox(widget.value, widget.description);
  }

  Row coolCheckbox(String value, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${widget.description} "),
        Functions.widthSpacing(),
        Checkbox(
            value: Functions.dataclass.data[widget.value],
            onChanged: (bool? moved) {
              setState(() {
                Functions.dataclass.data[widget.value] = moved;
                print(Functions.dataclass.data[widget.value] = moved);
              });
            }),
      ],
    );
  }
}
