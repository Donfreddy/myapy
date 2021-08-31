import 'dart:convert';

import 'package:mypay/utils/models/oprator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OperatorBloc {
  Map<String, dynamic> defaultOp = {
    'id': 1,
    'name': 'Orange Money',
    'logoPath': 'assets/images/Orange-Money.png'
  };

  BehaviorSubject<Operator> _changeOperator = BehaviorSubject<Operator>();
  Stream<Operator> get changeOperator => _changeOperator.stream;

  Function(Operator) get changePrefs => _changeOperator.sink.add;

  OperatorBloc() {
    _loadOperator();
    _changeOperator.stream.listen(_newOperator);
  }

  Future<Null> _loadOperator() async {
    final prefs = await SharedPreferences.getInstance();

    // get default operator if exist
    if (prefs.getString('operator') != null)
      defaultOp = jsonDecode(prefs.getString('operator') ?? '');

    _changeOperator.add(Operator.fromJson(defaultOp));
  }

  void _newOperator(Operator op) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('operator', jsonEncode(op));
  }

  dispose() {
    _changeOperator.close();
  }
}
