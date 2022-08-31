import 'package:flutter/material.dart';

void main() => runApp(SimpleApp());

class SimpleApp extends StatelessWidget {
  SimpleApp({Key? key}) : super(key: key);

  final titles = ["List 1"];
  final subtitles = ["details for List 1"];
  final icons = [Icons.ac_unit];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Simple List App"),
        ),
        body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () => print("Gedrückt"),
                  title: SelectableText(titles[index]),
                  subtitle: SelectableText(subtitles[index]),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => print("Hakan"),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
