


import 'package:flutter/material.dart';

class AGVTaskBox extends StatefulWidget {
  final Widget content;
  final double width;
  final double height;
  const AGVTaskBox({Key? key,required this.content,required this.width,required this.height}) : super(key: key);

  @override
  _AGVTaskTableState createState() => _AGVTaskTableState();
}

class _AGVTaskTableState extends State<AGVTaskBox> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: widget.content,
        ),
      ),
    );
  }
}
