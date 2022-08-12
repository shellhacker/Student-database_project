import 'dart:convert';
import 'dart:io';

import 'package:database_project/Screen_homepage/db/db%20function/data_function.dart';
import 'package:database_project/Screen_homepage/db/db%20model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudentWeidget extends StatefulWidget {
  const AddStudentWeidget({Key? key}) : super(key: key);

  @override
  State<AddStudentWeidget> createState() => _AddStudentWeidgetState();
}

class _AddStudentWeidgetState extends State<AddStudentWeidget> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();

  final _numbercontroller = TextEditingController();

  final _classcontroller = TextEditingController();

  final _emailcontroller = TextEditingController();

  File? imagefile;
  String imagestring = '';
  String newimage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  backgroundImage:
                      MemoryImage(const Base64Decoder().convert(newimage)),
                  radius: 45,
                ),
                TextButton.icon(
                  onPressed: () {
                    showBottomSheet(context);
                  },
                  icon: const Icon(Icons.image),
                  label: const Text('Upload Image'),
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _namecontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _numbercontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _classcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Domain',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Domain Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _emailcontroller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email Id'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Id Is Empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {}
                      onAddStudentDetails(context);
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add Students')),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> showBottomSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx1) {
        return Container(
          height: 100,
          width: double.infinity,
          color: Colors.pink,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              const Text(
                'choose your profile photo',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      takePic(ImageSource.camera);
                    },
                    icon: const Icon(
                      Icons.camera_front_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      takePic(ImageSource.gallery);
                    },
                    icon: const Icon(
                      Icons.image_rounded,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ]),
          ),
        );
      },
    );
  }

  // Widget imageprofile(BuildContext context) {
  //   return Stack(
  //     children: [
  //       imagefile != null
  //           ? Image.file(
  //               imagefile!,
  //               width: 250,
  //               height: 250,
  //               fit: BoxFit.cover,
  //             )
  //           : Image.asset('assets/avathar.png', width: 250, height: 250),
  //       Padding(
  //         padding: const EdgeInsets.only(top: 150, left: 150),
  //         child: IconButton(
  //           onPressed: () {
  //             showBottomSheet(context);
  //           },
  //           icon: const Icon(
  //             Icons.camera_alt,
  //             color: Colors.pink,
  //             size: 80,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  takePic(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    final bytes = File(image!.path).readAsBytesSync();
    imagestring = base64Encode(bytes);
    setState(() {
      newimage = imagestring;
    });
  }

  Future<void> onAddStudentDetails(BuildContext context) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _name = _namecontroller.text.trim();
    // ignore: no_leading_underscores_for_local_identifiers
    final _number = _numbercontroller.text.trim();
    // ignore: no_leading_underscores_for_local_identifiers
    final _className = _classcontroller.text.trim();
    // ignore: no_leading_underscores_for_local_identifiers
    final _email = _emailcontroller.text.trim();

    if (_name.isEmpty ||
        _number.isEmpty ||
        _className.isEmpty ||
        _email.isEmpty) {
      const Text('Required Field is Empty');
    } else {
      final StudentModel studentDb = StudentModel(
          name: _name,
          classname: _className,
          number: _number,
          email: _email,
          image: newimage);
      addStudent(studentDb);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Added'),
          backgroundColor: Color.fromARGB(255, 3, 141, 8)));
      _namecontroller.clear();
      _numbercontroller.clear();
      _classcontroller.clear();
      _emailcontroller.clear();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
