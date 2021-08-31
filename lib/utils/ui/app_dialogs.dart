/// All the custom app dialogs UI will be present in this file.

import 'package:flutter/material.dart';

class AppDialogs {
  static Future<bool?> openAppSettings(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => new AlertDialog(
        title: Text("Phone Permissions"),
        contentPadding: EdgeInsets.fromLTRB(24, 12, 24, 0),
        content: Text(
            "We are having problems retrieving permissions. Would you like to open the app settings to fix?"),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Settings'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ],
      ),
    );
  }
}
