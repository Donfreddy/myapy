import 'package:flutter/cupertino.dart';
import 'package:mypay/common/constants/route_constants.dart';
import 'package:mypay/pages/404.dart';
import 'package:mypay/pages/home/home.dart';
import 'package:mypay/pages/transactions/airtime_purchase.dart';
import 'package:mypay/pages/transactions/money_transfer.dart';
import 'package:mypay/utils/models/transaction.dart';

Route generateRoute(RouteSettings settings) {
  Object? args = settings.arguments;

  switch (settings.name) {
    case RouteList.initial:
      return CupertinoPageRoute<Widget>(builder: (_) => Home());

    case RouteList.moneyTransfer:
      return CupertinoPageRoute<Widget>(
        builder: (_) => Moneytransfer(
          transaction: args as Transaction,
        ),
      );

    case RouteList.airtimePurchase:
      return CupertinoPageRoute<Widget>(
        builder: (_) => AirTimePurchase(
          transaction: args as Transaction,
        ),
      );

    default:
      return CupertinoPageRoute(
        builder: (_) => Page404(routeName: settings.name),
      );
  }
}
