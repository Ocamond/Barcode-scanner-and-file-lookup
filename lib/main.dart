import 'expandable_fab.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Simplelist());

class Simplelist extends StatefulWidget {
  const Simplelist({Key? key}) : super(key: key);

  @override
  State<Simplelist> createState() => SimplelistState();
}

class SimplelistState extends State<Simplelist> {
  final titles = ["List 1"];
  final subtitles = ["details for List 1"];
  final icons = [Icons.ac_unit];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  trailing: Icon(icons[index]),
                ),
              );
            },
          ),
        ),
        floatingActionButton: const ExampleExpandableFab(),
      ),
    );
  }
}
