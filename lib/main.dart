import 'package:flutter/material.dart';
import './models/enums.dart' as lib;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Star Wars Characters"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
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
                });
              },
              isExpanded: true,
            ),
            Text(
              "There are 5 characters",
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
