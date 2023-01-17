import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:self_project/components/providerExample.dart';
import 'package:self_project/views/homepage.dart';

void main() async {
  runApp(ChangeNotifierProvider(create: (context) => SelectedProduct(),
  child: const MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
