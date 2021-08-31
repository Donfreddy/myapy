import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mypay/blocs/operator_bloc.dart';
import 'package:mypay/common/constants/route_constants.dart';
import 'package:mypay/pages/drawer/main_drawer.dart';
import 'package:mypay/pages/home/components/tansaction_card.dart';
import 'package:mypay/utils/models/transaction.dart';
import 'package:mypay/widgets/app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  final OperatorBloc _operatorBloc = OperatorBloc();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void closeEndDrawer() {
    Navigator.of(context).pop();
  }

  Future<bool> displayShowcase() async {
    var box = await Hive.openBox<bool>('settings');
    bool? showcaseVisibilityStatus =
        box.get('showShowcase', defaultValue: false);

    if (showcaseVisibilityStatus == false) {
      box.put('showShowcase', true);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: fullAppbar(context, _operatorBloc, openEndDrawer),
      endDrawer: MainDrawer(closeEndDrawer: closeEndDrawer),
      body: GridView.builder(
        itemCount: transactions.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          return Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            child: InkWell(
              onTap: () {
                onTransactionTaped(transactions[index]);
              },
              borderRadius: BorderRadius.circular(12),
              child: TransactionCard(transaction: transactions[index]),
            ),
          );
        },
      ),
    );
  }

  void onTransactionTaped(Transaction data) {
    switch (data.id) {
      case 1:
        Navigator.pushNamed(
          context,
          RouteList.moneyTransfer,
          arguments: data,
        );
        break;
      case 2:
        Navigator.pushNamed(
          context,
          RouteList.airtimePurchase,
          arguments: data,
        );
        break;
      default:
        print(data.id);
    }
  }
}
