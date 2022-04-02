import 'package:flutter/material.dart';

import '../../../../../shared/constants.dart';

class MiFormTextArea extends StatelessWidget {
  const MiFormTextArea({Key? key, this.changed}) : super(key: key);

  final Function(String)? changed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xccFFFFFF),
        border: Border.all(color: Color(0x33181743)),
      ),
      child: Padding(
        padding: EdgeInsets.all(miDefaultSize * 0.7),
        child: TextFormField(
          validator: (value) =>
              value!.isEmpty ? "Please describe your task" : null,
          onChanged: changed,
          keyboardType: TextInputType.multiline,
          style: TextStyle(
            fontSize: miDefaultSize * 1.3,
            color: miTextColor,
          ),
          maxLines: null,
          minLines: 8,
          decoration: InputDecoration(
            hintText: "Enter task details here...",
            errorStyle: TextStyle(
              fontStyle: FontStyle.italic,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
