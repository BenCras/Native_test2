import 'dart:html';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import './models/data.dart' as lib;
import './models/enums.dart' as val;

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Main());
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  String dropdownvalue = 'All';
  var items = [
    'All',
    'Resistance',
    'Sith',
    'Jedi Order',
  ];

  List<dynamic> characters = lib.characters;

  void editList() {
    if (dropdownvalue != 'All') {
      for (int i = 0; i < characters.length - 1; i++) {
        if (!characters[i]['affiliations'].contains('dropdownvalue')) {
          characters[i].remove;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Star Wars Characters"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Select a side:",
              textAlign: TextAlign.left,
            ),
            DropdownButton(
              value: dropdownvalue,
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  editList();
                });
              },
              isExpanded: true,
            ),
            const Text(
              "There are * characters",
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: characters.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                "https://picsum.photos/200?image=${characters[index]['id']}",
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Text("${characters[index]['name']}")
                        ],
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
