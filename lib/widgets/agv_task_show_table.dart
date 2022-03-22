
import 'package:flutter/material.dart';

class AGVTaskShow extends StatefulWidget {
  const AGVTaskShow({Key? key}) : super(key: key);

  @override
  _AGVTaskShowState createState() => _AGVTaskShowState();
}

class _AGVTaskShowState extends State<AGVTaskShow> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
            columns: [
              DataColumn(label: Text('序号')),
              DataColumn(label: Text('下料点')),
              DataColumn(label: Text('对应位')),
              DataColumn(label: Text('叫车时间')),
              DataColumn(label: Text('发车时间')),
              DataColumn(label: Text('操作')),
            ],
            rows: [
            ]
        );
  }
}
