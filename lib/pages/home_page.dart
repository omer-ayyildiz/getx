import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:getx_ornek/controller/main_controller.dart';
import 'package:get/get.dart';
import 'package:getx_ornek/pages/add_record_page.dart';
import 'package:getx_ornek/pages/graph_page.dart';
import 'history_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final contoller = Get.put(MainController());
  int _bottomNavigationNavIndex = 0;
  Widget _currentScreen = const GraphPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('GetX kullanımı')),
      body: _currentScreen,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(const AddRecordPage());
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        height: Get.height / 10,
        activeIndex: _bottomNavigationNavIndex,
        gapLocation: GapLocation.center,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.black,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        iconSize: 30,
        onTap: (p0) {
          setState(() {
            _bottomNavigationNavIndex = p0;
            _currentScreen =
                (p0 == 0) ? const GraphPage() : const HistoryPage();
          });
        },
      ),
    );
  }

  final iconList = [
    Icons.show_chart,
    Icons.history,
  ];
}
