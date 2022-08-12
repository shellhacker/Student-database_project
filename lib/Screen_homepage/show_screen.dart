import 'dart:convert';

import 'package:database_project/Screen_homepage/db/db%20model/data_model.dart';
import 'package:database_project/Screen_homepage/edit_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowScreen extends StatelessWidget {
  StudentModel data;
  int? index;
  ShowScreen({Key? key, required this.data, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        EditScreen(data: data, index: index)));
              },
              icon:const Icon(Icons.edit))
        ],
      ),
      body: Column(children: [
        Center(
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.greenAccent[100],
            child: SizedBox(
              width: 300,
              height: 600,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.pink,
                      radius: 108,
                      child: CircleAvatar(
                        backgroundImage:
                            MemoryImage(const Base64Decoder().convert(data.image)),
                        radius: 100,
                      ),
                    ),
                   const SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_interpolation_to_compose_strings
                    Text(' ' + data.name,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.green[900],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_interpolation_to_compose_strings
                    Text( 'Class:' + data.classname,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_interpolation_to_compose_strings
                    Text( 'Contact:' + data.number,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ignore: prefer_interpolation_to_compose_strings
                    Text( 'Email:' + data.email,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
