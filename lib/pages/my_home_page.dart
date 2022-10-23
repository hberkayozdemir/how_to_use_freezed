import 'package:flutter/material.dart';
import 'package:how_to_use_freezed/data_initialization/load_undo_list.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  List<List<Widget>> namesList = loadUndoList();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sayfa ${page + 1}'),
      ),
      body: ListView.builder(
        itemCount: namesList[page].length,
        itemBuilder: (context, index) {
          return namesList[page][index];
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                if (page > 0) {
                  page--;
                }
              });
            },
            child: const Icon(Icons.undo),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (page < namesList.length - 1) {
                  page++;
                }
              });
            },
            child: const Icon(Icons.redo),
          ),
        ],
      ),
    );
  }
}
