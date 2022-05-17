import 'package:flutter/material.dart';

class StatisticalWidget extends StatelessWidget {
  String text;
  String total;
  StatisticalWidget({Key? key, required this.text, required this.total})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Text(text),
            flex: 1,
          ),
          Expanded(
            child: Text(total),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
