import 'dart:convert';

import 'package:database_project/Screen_homepage/addstudentwidget.dart';
import 'package:database_project/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/Screen_homepage/db/db%20model/data_model.dart';

import 'package:database_project/Screen_homepage/liststudentwidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  StudentModel data;
  int? index;
  EditScreen({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _namecontroller = TextEditingController();
  final _numbercontroller = TextEditingController();
  final _classcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _namecontroller.text = widget.data.name.toString();
    _classcontroller.text = widget.data.classname.toString();
    _numbercontroller.text = widget.data.number.toString();
    _emailcontroller.text = widget.data.email.toString();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 108,
                child: CircleAvatar(
                  backgroundImage: MemoryImage(
                      const Base64Decoder().convert(widget.data.image.toString())),
                  radius: 100,
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.image),
                label: const Text('Upload Image'),
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _numbercontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _classcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                textAlign: TextAlign.center,
                controller: _emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    onAddStudentDetails(context);
                    const AddStudentWeidget();
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save Data')),
            ],
          ),
        ]),
      ),
    );
  }

  onAddStudentDetails(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _name = _namecontroller.text;
    // ignore: no_leading_underscores_for_local_identifiers
    final _number = _numbercontroller.text;
    // ignore: no_leading_underscores_for_local_identifiers
    final _className = _classcontroller.text;
    // ignore: no_leading_underscores_for_local_identifiers
    final _email = _emailcontroller.text;
    // ignore: no_leading_underscores_for_local_identifiers, prefer_const_declarations
    final _newimage = '';

    if (_name.isEmpty ||
        _number.isEmpty ||
        _className.isEmpty ||
        _email.isEmpty) {
      return const Text('Required Field is Empty');
    } else {
      final editedstudent = StudentModel(
          name: _name,
          number: _number,
          classname: _className,
          email: _email,
          image: _newimage);

      // StudentModel(name: _name, number: _number, classname: _className, email: _email,);
      editStudent(data: editedstudent, index: widget.index);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Updated'),
          backgroundColor: Color.fromARGB(255, 3, 141, 8)));
      _namecontroller.clear();
      _numbercontroller.clear();
      _classcontroller.clear();
      _emailcontroller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
      ListStudentWidget();
    }
  }
}
