
import 'package:carrier_agv/layout/agvDispatchLayout/agv_task_box.dart';
import 'package:carrier_agv/widgets/agv_task_show_table.dart';
import 'package:carrier_agv/widgets/agv_task_table_with_title.dart';
import 'package:flutter/material.dart';

class AGVDispatch extends StatefulWidget {

  const AGVDispatch({Key? key}) : super(key: key);

  @override
  _AGVDispatchState createState() => _AGVDispatchState();
}

class _AGVDispatchState extends State<AGVDispatch> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AGVTaskBox(
                  width: 600,
                  height: 300,
                  content:AGVTaskTable(
                    title: '下料点',
                    buttonName: 'ADD',
                  ),
                ),
                AGVTaskBox(
                  width: 600,
                  height: 300,
                  content: AGVTaskTable(
                    title: '对应位',
                    buttonName: 'ADD',
                  ),
                )
              ],
            )
        ),
        SizedBox(height: 5.0),
        Expanded(
          child: AGVTaskBox(
            width: 800,
            height: 300,
            content: AGVTaskShow(),
          ),
        )
        // Container(
        //   width: 400,
        //   height: 350,
        //   child: Padding(
        //     padding: const EdgeInsets.all(10.0),
        //     child: AGVTaskTable(title: '下料点'),
        //   ),
        // )
      ],
    );
  }
}
