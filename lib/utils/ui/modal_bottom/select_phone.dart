import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:mypay/utils/ui/app_color.dart';



class SelectPhone extends StatelessWidget {
  final Iterable<Item>? phones;

  const SelectPhone({
    Key? key,
    this.phones,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      // decoration: BoxDecoration(
      //   // color: white,
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(16),
      //     topRight: Radius.circular(16),
      //   ),
      // ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          Text(
            'Selectionner un numero',
            style: TextStyle(color: AppColor.gray3),
          ),
          SizedBox(
            height: 16,
          ),
          ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: phones!
                .map(
                  (item) => ListTile(
                    dense: true,
                    title: Text(
                      item.value ?? '',
                      style: TextStyle(fontSize: 14),
                    ),
                    onTap: () {},
                    trailing: Text(
                      item.label ?? '',
                      style: TextStyle(color: AppColor.gray3),
                    ),
                  ),
                )
                .toList(),
          ),
          ListTile(
            title: Text('Annuler', style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
            dense: true,
          ),
        ],
      ),
    );
  }
}

void modalBottomSheet(BuildContext ctx, Iterable<Item>? phones) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: AppColor.gray6,
    context: ctx,
    // shape: BorderRadius.circular(radius),
    builder: (_) => SelectPhone(phones: phones),
  );
}
