import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder()),
        style: TextStyle(fontSize: 64, letterSpacing: 32),
      ),
      actions: [
        TextButton(
          onPressed: () => print('cancel'),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () => print('confirm'),
          child: Text('Confirm'),
        ),
      ],
    );
  }
}
