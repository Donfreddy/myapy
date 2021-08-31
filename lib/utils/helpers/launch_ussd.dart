import 'package:flutter/material.dart';
import 'package:mypay/utils/ui/app_dialogs.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:ussd/ussd.dart';

Future<void> launchUssd(String ussdCode, BuildContext context) async {
  final status = await Permission.phone.status;

  if (status.isDenied) {
    await Permission.phone.request();
  } else if (status.isGranted) {
    await Ussd.runUssd(ussdCode);
  } else {
    bool? openApp = await AppDialogs.openAppSettings(context);

    if (openApp == true) openAppSettings();
  }
}
