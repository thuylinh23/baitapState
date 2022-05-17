import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  String? hintText;
  late final controller;
  bool autoFocus = true;
  late FocusNode myFocusNode;

  InputWidget({this.hintText, this.controller, required this.myFocusNode});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextField(
        controller: widget.controller,
        autofocus: true,
        focusNode: widget.myFocusNode,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
