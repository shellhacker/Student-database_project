import 'package:database_project/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/Screen_homepage/db/db%20model/data_model.dart';
import 'package:database_project/Screen_homepage/show_screen.dart';
import 'package:flutter/material.dart';

ValueNotifier<List<StudentModel>> temp = ValueNotifier([]);

class ScreenSearch extends StatelessWidget {
  ScreenSearch({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            onTap: () {},
            onChanged: (String? value) {
              if (value == null || value.isEmpty) {
                temp.value.addAll(studentListNotifier.value);
                // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                temp.notifyListeners();
              } else {
                temp.value.clear();
                for (StudentModel i in studentListNotifier.value) {
                  if (i.name.toLowerCase().contains(value.toLowerCase())) {
                    temp.value.add(i);
                  }
                  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                  temp.notifyListeners();
                }
              }
            },
            controller: searchController,
            decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search'),
          ),
        ),
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: temp,
        builder:
            (BuildContext ctx, List<StudentModel> searchdata, Widget? child) {
          return ListView.separated(
              itemBuilder: (ctx, index) {
                final data = searchdata[index];
                return ListTile(
                  title: Text(data.name),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => ShowScreen(
                          data: data,
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: searchdata.length);
        },
      )),
    );
  }
}
