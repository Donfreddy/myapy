import 'package:flutter/material.dart';
import 'package:mypay/blocs/operator_bloc.dart';
import 'package:mypay/utils/models/oprator.dart';
import 'package:mypay/utils/ui/app_color.dart';

class SelectOperator extends StatelessWidget {
  final int id;
  final OperatorBloc prefsBloc;

  SelectOperator(this.id, this.prefsBloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      //padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Column(
            children: List.generate(
              operators.length,
              (i) => OperatorCard(id, operators[i], prefsBloc),
            ),
          )
        ],
      ),
    );
  }
}

class OperatorCard extends StatelessWidget {
  final int id;
  final Operator _operator;
  final OperatorBloc prefsBloc;

  OperatorCard(this.id, this._operator, this.prefsBloc);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        prefsBloc.changePrefs(_operator);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColor.black.withOpacity(0.1),
              offset: Offset(0.0, 3.0),
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(08),
                child: Image.asset(
                  _operator.logoPath,
                  fit: BoxFit.cover,
                  width: 65,
                ),
              ),
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _operator.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  _operator.id == id ? 'Choisi' : 'Sélectionner',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppColor.gray3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void modalBottomSheet(BuildContext ctx, OperatorBloc prefsBloc, int id) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: ctx,
    builder: (_) => SelectOperator(id, prefsBloc),
  );
}
