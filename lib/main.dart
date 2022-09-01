import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(const Simplelist());

class Simplelist extends StatefulWidget {
  const Simplelist({Key? key}) : super(key: key);

  @override
  State<Simplelist> createState() => SimplelistState();
}

class SimplelistState extends State<Simplelist> {
  final titles = ["List 1"];
  final icons = [Icons.ac_unit];

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      titles.add(barcodeScanRes);
      icons.add(Icons.accessibility_outlined);
    });
  }

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
                  onTap: () => print(titles[index]),
                  title: SelectableText(titles[index]),
                  trailing: Icon(icons[index]),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scanBarcodeNormal();
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
