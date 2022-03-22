
import 'package:carrier_agv/layout/agv_dispatch.dart';
import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: [
          AGVDispatch(),
          Text('bbb'),
          Text('ccc'),
        ]
    );
  }
}
