
import 'package:flutter/material.dart';

class AGVShowDialog extends StatefulWidget {
  final String dialogName;
  const AGVShowDialog({Key? key,required this.dialogName}) : super(key: key);

  @override
  _AGVShowDialogState createState() => _AGVShowDialogState();
}

class _AGVShowDialogState extends State<AGVShowDialog> {
  TextEditingController startPointController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(widget.dialogName),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
            TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '请输入起点',
                ),
                keyboardType: TextInputType.number,
                controller: startPointController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter some value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '请输入名称',
                  ),
                  controller: nameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter some value';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          // setUpCuttingList(int.parse(startPointController.text),nameController.text);
                        }
                      },
                      child: Text(
                        'Confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                    ),
                    SizedBox(width: 10,),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Cancell',
                        style: TextStyle(color:Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                  )
            ],
          ),
        ]
        ),
        )
      ],
    );
  }
}
