import 'package:database_project/Screen_homepage/addstudentwidget.dart';
import 'package:database_project/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/Screen_homepage/liststudentwidget.dart';
import 'package:database_project/Screen_homepage/search_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentSelectedIndex = 0;
  final _pages = [
    const AddStudentWeidget(),
    ScreenSearch(),
    ListStudentWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentSelectedIndex,
          onTap: (newindex) {
            setState(() {
              _currentSelectedIndex = newindex;
             
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List')
          ]),
    );
  }
}
