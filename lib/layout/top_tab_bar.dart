


import 'package:flutter/material.dart';

class TopTabBar extends StatelessWidget {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        bottom: const TabBar(tabs: [
          Tab(text: '车辆调度'),
          Tab(text: '日志查询'),
          Tab(text: '网络配置'),
        ]),
        title: Text('AGV Delving app'),
        centerTitle: true,
    );
  }
}
