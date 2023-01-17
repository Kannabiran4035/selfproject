import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveWidget extends StatefulWidget {
  HiveWidget({super.key});

  @override
  State<HiveWidget> createState() => _HiveWidgetState();
}

class _HiveWidgetState extends State<HiveWidget> {
  final nameController = TextEditingController();

  var box = Hive.box('myBox');

  void putdata() {
    box.put("name", nameController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
        ),
        ElevatedButton(
            onPressed: () {
              // box.put("Name", nameController.text);
              box.put('name', 'David');
              var name = box.get('name');
              // var name = box.get("Name");

              print('Name: $name');
              // print(name.values);
            },
            child: Text("Save"))
      ],
    );
  }
}
