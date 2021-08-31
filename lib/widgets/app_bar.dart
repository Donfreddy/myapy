import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mypay/blocs/operator_bloc.dart';
import 'package:mypay/common/constants/assest_path.dart';
import 'package:mypay/pages/home/components/operator_card.dart';
import 'package:mypay/utils/models/oprator.dart';
import 'package:mypay/utils/ui/app_color.dart';

import 'circle.dart';

PreferredSizeWidget fullAppbar(
  BuildContext context,
  OperatorBloc operatorBloc,
  Function openEndDrawer,
) {
  return PreferredSize(
    preferredSize: Size.fromHeight(180.0),
    child: AppBar(
      leading: Container(
        padding: EdgeInsets.only(left: 16),
        child: SvgPicture.asset(APP_LOGO, color: AppColor.white),
      ),
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      backgroundColor: AppColor.mainColor,
      title: Container(
        child: Text(
          'Bienvenue',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          padding: EdgeInsets.only(right: 10.0),
          icon: SvgPicture.asset(ICON_MENU, color: AppColor.white),
          onPressed: () {
            openEndDrawer();
          },
        ),
      ],
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: StreamBuilder<Operator>(
          initialData: Operator.fromJson(operatorBloc.defaultOp),
          stream: operatorBloc.changeOperator,
          builder: (context, snapshot) {
            final data = snapshot.data!;

            if (snapshot.hasData) {
              return OperatorCard(
                userOperator: data,
                operatorBloc: operatorBloc,
                id: data.id,
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    ),
  );
}

PreferredSizeWidget emptyAppbar(
    BuildContext context, Color color, String title) {
  return PreferredSize(
    preferredSize: Size.fromHeight(75.0),
    child: AppBar(
      backgroundColor: color,
      flexibleSpace: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomPaint(
            painter: CircleOne(),
          ),
          CustomPaint(
            painter: CircleTwo(),
          ),
        ],
      ),
      centerTitle: true,
      title: Text(title),
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert, color: AppColor.white),
          itemBuilder: (_) => <PopupMenuItem<String>>[
            PopupMenuItem(
              child: Text('Mon solde'),
              value: 'edit',
            ),
            PopupMenuItem(
              child: Text('Dernieres transactions'),
              value: 'edit2',
            ),
          ],
          onSelected: (String selected) {
            switch (selected) {
              case 'edit':
                //
                print(selected);
                break;
              case 'edit2':
                //
                print(selected);
                break;
              default:
            }
          },
        ),
      ],
      elevation: 0,
    ),
  );
}

Widget simpleAppBar(String? title) {
  return AppBar(
    title: Text(title!),
    centerTitle: true,
  );
}
