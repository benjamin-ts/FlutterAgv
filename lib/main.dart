import 'dart:ffi';

import 'package:carrier_agv/layout/app_layout.dart';
import 'package:carrier_agv/layout/top_tab_bar.dart';
import 'package:carrier_agv/models/AGVDelive.dart';
import 'package:carrier_agv/models/Cutting.dart';
import 'package:carrier_agv/styles/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const AGVDashbooardApp());
}

class AGVDashbooardApp extends StatelessWidget {
  const AGVDashbooardApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      // home: const HomePage(),
      home: DefaultTabController(child:HomePage(),length: 3),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AGVDelive> taskList = [
    AGVDelive(taskID: 'task1',fromStationID: 4108,toStationID:4620,agvCode: ''),
    AGVDelive(taskID: 'task2',fromStationID: 5640,toStationID:8940,agvCode: ''),
  ];
  List<Cutting> cuttingList = [
    Cutting(id:1,startPoint: 1234,name: 'task1'),
    Cutting(id:2,startPoint: 5678,name: 'task2'),
  ];
  // AGVDelive selectedTask;
  // List<DataTable>? listTable = [
  //     DataTable(columns: const [
  //       DataColumn(label: Text('TaskID')),
  //       DataColumn(label: Text('FromStationID')),
  //       DataColumn(label: Text('ToStationID')),
  //       DataColumn(label: Text('Action')),
  //     ],rows: [])
  // ];
  // TextEditingController taskIDController = TextEditingController();
  // TextEditingController fromStationIDController = TextEditingController();
  // TextEditingController toStationIDController = TextEditingController();
  // TextEditingController agvCodeController = TextEditingController();
  TextEditingController startPointController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController editStartPointController = TextEditingController();
  TextEditingController editNameController = TextEditingController();
  // void setUpListTable(){
  //   print('click me');
  // }
  @override
  void initState() {
    super.initState();
    print('initState ran');
  }
  void changeCuttingListProgress(List<Cutting> cuttingList){
    setState(() {
      cuttingList = cuttingList;
    });
  }
  // void changeProgress(List<AGVDelive> taskList){
  //   setState(() {
  //     taskList = taskList;
  //   });
  // }
  void setUpCuttingList(int startPoint,String name){
    Cutting cutting = Cutting(id:0);
    cutting.id = cuttingList.length + 1;
    cutting.startPoint = startPoint;
    cutting.name = name;
    cuttingList.add(cutting);
    changeCuttingListProgress(cuttingList);
  }
  void changeOneRow(int id,int? startPoint,String name){
    for(int i = 0 ; i < cuttingList.length;i++ ){
      if(cuttingList[i].id == id) {
        if(startPoint != null) {
          cuttingList[i].startPoint = startPoint;
        }
        if(name != '') {
          cuttingList[i].name = name;
        }
      }
    }
    changeCuttingListProgress(cuttingList);
  }
  void deleteOneRow(int id){
    for(int i = 0;i<cuttingList.length;i++){
      if(cuttingList[i].id == id){
        cuttingList.removeWhere((element) => element.id == id);
      }
    }
    changeCuttingListProgress(cuttingList);
  }
  // void setUpTaskList(String taskID,int fromStationID,int toStationID,String agvCode){
  //   AGVDelive agvDelive = AGVDelive();
  //   agvDelive.taskID = taskID;
  //   agvDelive.fromStationID = fromStationID;
  //   agvDelive.toStationID = toStationID;
  //   agvDelive.agvCode = agvCode;
  //   taskList.add(agvDelive);
  //   changeProgress(taskList);
  // }
  // void deleteTaskList(AGVDelive agvDelive){
  //   taskList.remove(agvDelive);
  //   changeProgress(taskList);
  // }
  // void deleteTask(AGVDelive agvDelive){
  //
  // }
  onSelectedRow(bool selected, AGVDelive task) async {
    setState(() {
      if (selected) {
        taskList.add(task);
      } else {
        taskList.remove(task);
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _formKeyEdit = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    print("build ran");
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(100),
      //   child: TopTabBar(),
      // ),
      // body: SafeArea(
      //   child: AppLayout(
      //
      //   ),
      // ),
      appBar: AppBar(
        bottom: const TabBar(tabs: [
          Tab(text: '车辆调度'),
          Tab(text: '日志查询'),
          Tab(text: '网络配置'),
        ]),
        title: Text('AGV Delving app'),
        centerTitle: true,
      ),
      body: TabBarView(
        // dragStartBehavior: DragStartBehavior.start,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // color: Colors.red,
                      width: 400.0,
                      height: 350.0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('下料点'),
                                  SizedBox(width: 200),
                                  TextButton(
                                    onPressed: (){
                                      showDialog(
                                        context: context,
                                        builder: (context){
                                          return SimpleDialog(
                                            title: Text('add task'),
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
                                                              setUpCuttingList(int.parse(startPointController.text),nameController.text);
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
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        }
                                      );
                                    },
                                    child: Text('add'),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.0,
                              ),
                              DataTable(
                                showCheckboxColumn: false,
                                dividerThickness: 1,
                                columns: [
                                  DataColumn(label: Text('起点')),
                                  DataColumn(label: Text('名称')),
                                  DataColumn(label: Text('操作')),
                                ],
                                rows: cuttingList
                                    .map((item) => DataRow(
                                      selected: cuttingList.contains(item),
                                      onSelectChanged: (selected){
                                        print('onselected');
                                        print(item.id);
                                      },
                                      cells: [
                                        DataCell(
                                          Text(item.startPoint.toString()),
                                        ),
                                        DataCell(
                                            Text(item.name!),
                                        ),
                                        DataCell(
                                          Row(
                                            key: ValueKey(item.id),
                                            children: [
                                              SizedBox(
                                                width:50,
                                                height: 25,
                                                child: TextButton.icon(
                                                  onPressed: (){
                                                    showDialog(
                                                      context: context,
                                                      builder: (context){
                                                        return SimpleDialog(
                                                          title: Text('edit task'),
                                                          children: [
                                                            Form(
                                                              key: _formKeyEdit,
                                                              child: Column(
                                                                children: [
                                                                  TextFormField(
                                                                    decoration: InputDecoration(
                                                                      border: OutlineInputBorder(),
                                                                      hintText: '请输入起点',
                                                                    ),
                                                                    keyboardType: TextInputType.number,
                                                                    controller: editStartPointController,
                                                                  ),
                                                                  TextFormField(
                                                                    decoration: InputDecoration(
                                                                      border: OutlineInputBorder(),
                                                                      hintText: '请输入名称',
                                                                    ),
                                                                    controller: editNameController,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      TextButton(
                                                                        onPressed: (){
                                                                          changeOneRow(item.id,int.tryParse(editStartPointController.text),editNameController.text);
                                                                          Navigator.of(context).pop();
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
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        );
                                                      }
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 10,
                                                  ),
                                                  label: Text(
                                                      '编辑',
                                                      style:TextStyle(
                                                        fontSize: 6,
                                                        color: Colors.white,
                                                      )
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              SizedBox(
                                                width:50,
                                                height: 25,
                                                child: TextButton.icon(
                                                  onPressed: (){
                                                    deleteOneRow(item.id);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 10,
                                                  ),
                                                  label: Text(
                                                      '删除',
                                                      style:TextStyle(
                                                        fontSize: 6,
                                                        color: Colors.white,
                                                      )
                                                  ),
                                                  style: ButtonStyle(
                                                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        )
                                ])
                                ).toList(),
                              )
                            ],
                          ),
                        ),
                      )
                    ),
                    Container(
                        // color: Colors.red,
                        width: 400.0,
                        height: 350.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('对应位'),
                                    SizedBox(width: 200),
                                    TextButton(
                                      onPressed: (){},
                                      child: Text('add'),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                ),
                                DataTable(
                                  dividerThickness: 1,
                                  columns: [
                                    DataColumn(label: Text('终点')),
                                    DataColumn(label: Text('名称')),
                                    DataColumn(label: Text('操作')),
                                  ],
                                  rows: [
                                    DataRow(cells: [
                                      DataCell(Text('123')),
                                      DataCell(Text('aaa')),
                                      DataCell(
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width:50,
                                              height: 25,
                                              child: TextButton.icon(
                                                onPressed: (){},
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                                label: Text(
                                                    '编辑',
                                                    style:TextStyle(
                                                      fontSize: 6,
                                                      color: Colors.white,
                                                    )
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            SizedBox(
                                              width:50,
                                              height: 25,
                                              child: TextButton.icon(
                                                onPressed: (){},
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                                label: Text(
                                                    '删除',
                                                    style:TextStyle(
                                                      fontSize: 6,
                                                      color: Colors.white,
                                                    )
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            SizedBox(
                                              width:50,
                                              height: 25,
                                              child: TextButton.icon(
                                                onPressed: (){},
                                                icon: Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 10,
                                                ),
                                                label: Text(
                                                    '叫车',
                                                    style:TextStyle(
                                                      fontSize: 6,
                                                      color: Colors.white,
                                                    )
                                                ),
                                                style: ButtonStyle(
                                                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ),
                                    ])
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Container(
                  // color: Colors.red,
                  width: 800,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: DataTable(
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
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text('bbb'),
          Text('ccc'),
        ],
      ),


    );
  }
}


