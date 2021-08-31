import 'dart:convert';

import 'package:mypay/utils/models/oprator.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Get operator from local storage
Future<Operator> getOprator() async {
  final prefs = await SharedPreferences.getInstance();
  dynamic operatorJson = jsonDecode(prefs.getString('operator') ?? '');

  return Operator.fromJson(operatorJson);
}

/// Get operator name by `operatorId`
String getOperatorName(int operatorId) {
  switch (operatorId) {
    case 1:
      return 'Orange';
    case 2:
      return 'MTN';
    case 3:
      return 'Yup';
    case 4:
      return 'EU';
    default:
      return 'Orange';
  }
}
