// https://www.youtube.com/watch?v=v5bfidqOY10
import 'package:flutter/material.dart';
import 'package:how_to_use_freezed/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomeApp(),
    );
  }
}
