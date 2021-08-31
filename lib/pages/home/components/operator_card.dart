import 'package:flutter/material.dart';
import 'package:mypay/blocs/operator_bloc.dart';
import 'package:mypay/utils/models/oprator.dart';
import 'package:mypay/utils/ui/app_color.dart';
import 'package:mypay/utils/ui/modal_bottom/select_operator.dart';

class OperatorCard extends StatelessWidget {
  final OperatorBloc operatorBloc;
  final Operator userOperator;
  final int id;

  const OperatorCard({
    Key? key,
    required this.userOperator,
    required this.operatorBloc,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // overlayColor: MaterialStateProperty.all(Colors.transparent),
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            modalBottomSheet(context, operatorBloc, id);
          },
          child: Container(
            // padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
            decoration: BoxDecoration(
              color: Color.fromRGBO(225, 255, 255, 0.31),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(08.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(08),
                    child: Image.asset(
                      userOperator.logoPath,
                      fit: BoxFit.cover,
                      width: 75,
                    ),
                  ),
                ),
                SizedBox(width: 05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userOperator.name,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Cliquez pour sélectionner\nun autre opérateur',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColor.white.withOpacity(0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
