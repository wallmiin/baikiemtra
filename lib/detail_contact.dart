import 'package:flutter/material.dart';

class DetailContact extends StatelessWidget {
  dynamic _contact;
  DetailContact({Key? key, required contact}) : _contact = contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail Contact'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              _contact['id'],
              textScaler: TextScaler.linear(2),
            ),
            Text(
              _contact['fullname'],
              textScaler: TextScaler.linear(2),
            ),
            Text(
              _contact['phone'],
              textScaler: TextScaler.linear(2),
            ),
            Text(
              _contact['createdAt'],
              textScaler: TextScaler.linear(2),
            ),
          ],
        ),
      ),
    );
  }
}
