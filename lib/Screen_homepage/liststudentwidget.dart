// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:database_project/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/Screen_homepage/show_screen.dart';
import 'package:flutter/material.dart';

import 'db/db model/data_model.dart';

class ListStudentWidget extends StatefulWidget {
  ListStudentWidget({Key? key}) : super(key: key);

  ValueNotifier<List<StudentModel>> temp = ValueNotifier([]);

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder:
          (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.pink,
                backgroundImage:
                    MemoryImage(const Base64Decoder().convert(data.image)),
                radius: 100,
              ),
              title: Text(data.name),
              subtitle:const Text('Show more details'),
              trailing: IconButton(
                onPressed: () {
                  deleteStudent(index);
                  //   if (data.id != null) {
                  //   deleteStudent(data.id!);

                  // }else{

                  // }
                },
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ShowScreen(data: data, index: index)));
              },
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: studentList.length,
        );
      },
    );
  }
}
