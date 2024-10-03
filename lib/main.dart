import 'package:flutter/material.dart';
import 'package:baikiemtra/list_contacts.dart';
import 'package:baikiemtra/add_contact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiểm tra',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,  // Tắt banner "Debug"
      home: const MyHomePage(title: 'List contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// on add contact press
  Future<void> onAddContactPress() async {
    var result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddContact()));

    print('Add status $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              onPressed: () => onAddContactPress(),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: ListContacts());
  }
}
