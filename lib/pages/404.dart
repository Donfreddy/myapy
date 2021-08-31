import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page404 extends StatelessWidget {
  final String? routeName;

  const Page404({Key? key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for $routeName'),
      ),
    );
  }
}
