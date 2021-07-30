import 'package:app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class LogOutAlertDialog extends StatefulWidget {
  // const LogOutAlertDialog({Key? key}) : super(key: key);

  @override
  _LogOutAlertDialogState createState() => _LogOutAlertDialogState();
}

class _LogOutAlertDialogState extends State<LogOutAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Before we log you out...',
        style: TextStyle(
          color: Colors.pinkAccent,
        ),
      ),
      content: const Text(
          'Please understand that your profile and data will be completely erased.' +
              '\n' +
              '\n' +
              'If you want to use the app again, you will need to create a new profile.'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text(
            'I changed my mind.',
            style: TextStyle(
              color: color_0,
            ),
          ),
        ),
        TextButton(
          onPressed: () => Phoenix.rebirth(context),
          child: const Text(
            'I understand. Log me out.',
            style: TextStyle(
              color: color_1,
            ),
          ),
        ),
      ],
    );
  }
}
