import 'package:flutter/material.dart';
import 'package:mypay/utils/models/transaction.dart';
import 'package:mypay/utils/ui/app_color.dart';
import 'package:mypay/widgets/app_bar.dart';

class AirTimePurchase extends StatefulWidget {
  final Transaction transaction;

  const AirTimePurchase({Key? key, required this.transaction})
      : super(key: key);

  @override
  _AirTimePurchaseState createState() => _AirTimePurchaseState();
}

class _AirTimePurchaseState extends State<AirTimePurchase> {
  // Variables
  String phone = '671842701';
  String amount = '0';

  // Ctrllers
  final phoneCtrller = TextEditingController();
  final amountCtrller = TextEditingController();

  onChangePhone(String newValue) {
    setState(() {
      phone = newValue;
    });
  }

  onChangeAmount(String newValue) {
    setState(() {
      amount = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: emptyAppbar(
        context,
        widget.transaction.iconColor ?? AppColor.white,
        widget.transaction.type,
      ),
      body: SingleChildScrollView(),
    );
  }
}
