import './functions.dart';
import 'package:flutter/material.dart';

class textBoxField extends StatefulWidget {
  textBoxField({Key? key, required this.value, required this.description})
      : super(key: key);

  String value;
  final String description;

  @override
  _TextBoxField createState() => _TextBoxField();
}

class _TextBoxField extends State<textBoxField> {
  @override
  Widget build(BuildContext context) {
    return coolCheckbox(widget.value, widget.description);
  }

  Row coolCheckbox(String value, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Text(" ${widget.description} ")),
        Functions.widthSpacing(),
        Expanded(
          child: TextField(
            obscureText: false,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.description,
            ),
            onChanged: (String? changedText) {
              Functions.dataclass.data[widget.value] = changedText!;
            },
          ),
        ),
      ],
    );
  }
}
