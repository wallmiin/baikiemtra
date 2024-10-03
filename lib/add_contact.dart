import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddContact extends StatelessWidget {
  AddContact({Key? key}) : super(key: key);

  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  /// on press add contact
  Future<void> onPressAddContact(BuildContext context) async {
    print(_fullnameController.text);
    var url =
        Uri.https('66f41b2577b5e889709854bd.mockapi.io', 'api/v1/contacts');
    var response = await http.post(url, body: {
      'fullname': _fullnameController.text,
      'phone': _phoneController.text
    });

    print(response.statusCode);

    if (response.statusCode == 201) {
      // show alert success
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Add Contact'),
      ),
      body: Column(
        children: [
          const SizedBox(width: 0.0, height: 15.0),
          TextField(
            controller: _fullnameController,
            decoration: const InputDecoration(
              labelText: 'Fullname',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: _phoneController,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(width: 0.0, height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                child: const Text('Add contact'),
                onPressed: () => onPressAddContact(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
