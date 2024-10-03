import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:baikiemtra/detail_contact.dart';
import 'package:http/http.dart' as http;

class ListContacts extends StatefulWidget {
  const ListContacts({Key? key}) : super(key: key);

  @override
  _ListContactsState createState() => _ListContactsState();
}

class _ListContactsState extends State<ListContacts> {
  bool isLoading = true;
  List<dynamic> _contacts = [];

  @override
  void initState() {
    super.initState();

    // load data contact
    loadDataContact();
  }

  /// load data contact
  Future<void> loadDataContact() async {
    // https://66fe2d6769936930895750c2.mockapi.io/contacts
    var url =
        Uri.https('66fe2d6769936930895750c2.mockapi.io', 'contacts');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        _contacts = json.decode(response.body);
        isLoading = false;
      });
    } else {
      throw Exception('Get contacts failed');
    }
  }

  /// On tap contact request
  void onTapContact(BuildContext context, int index) {
    print(index);
    // Navigate to detail contact
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DetailContact(contact: _contacts[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        reverse: true,
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTapContact(context, index),
            child: Card(
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    _contacts[index]['avartar'],
                    width: 130,
                  ),
                  Column(
                    children: [
                      Text(
                        _contacts[index]['fullname'],
                        textScaler: TextScaler.linear(1.5),
                      ),
                      Text(_contacts[index]['phone'] ?? 'No phone'),
                      Text(_contacts[index]['createdAt'] ?? 'No email'),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
