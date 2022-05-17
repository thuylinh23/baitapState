import 'package:baitapstate/utils/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final onpressed;
  final String textButton;
  const ButtonWidget(
      {Key? key, required this.onpressed, required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(
          textButton,
          textAlign: TextAlign.center,
        ),
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          primary: CustomColor.buttonColor,
          onPrimary: CustomColor.textButtonColor,
          padding: const EdgeInsets.all(2),
        ),
      ),
    );
  }
}
