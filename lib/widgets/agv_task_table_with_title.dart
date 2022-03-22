
import 'package:carrier_agv/widgets/agv_show_dialog_form.dart';
import 'package:flutter/material.dart';

class AGVTaskTable extends StatefulWidget {
  final String title;
  final String buttonName;
  const AGVTaskTable({Key? key,required this.title,required this.buttonName}) : super(key: key);

  @override
  _AGVTaskTableState createState() => _AGVTaskTableState();
}

class _AGVTaskTableState extends State<AGVTaskTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(widget.title),
            SizedBox(width: 450,),
            TextButton(
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AGVShowDialog(
                        dialogName: 'add task',);
                    }
                  );
                },
                child: Text(widget.buttonName),
            )
          ],
        )
      ],
    );
  }
}
