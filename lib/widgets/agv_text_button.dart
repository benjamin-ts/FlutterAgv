

import 'package:flutter/material.dart';

class AGVTextButton extends StatefulWidget {
  final String ButtonTitle;
  const AGVTextButton({Key? key,required this.ButtonTitle}) : super(key: key);

  @override
  _AGVTextButtonState createState() => _AGVTextButtonState();
}

class _AGVTextButtonState extends State<AGVTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){

        },
        child: Text(widget.ButtonTitle),
    );
  }
}
