import 'package:flutter/material.dart';
import 'package:mypay/common/constants/assest_path.dart';
import 'package:mypay/utils/helpers/hex_color.dart';
import 'package:mypay/utils/helpers/colors.dart';
import 'package:mypay/utils/ui/app_color.dart';

class Transaction {
  int id;
  String type;
  String iconPath;
  Color? iconColor;
  Color color;

  Transaction({
    required this.id,
    required this.type,
    required this.iconPath,
    this.iconColor,
    required this.color,
  });

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'type': this.type,
        'iconPath': this.iconPath,
        'iconColor': this.iconColor!.getColorString,
        'color': this.color.getColorString,
      };

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: json['type'],
      iconPath: json['iconPath'],
      iconColor: json['iconColor'].toString().getColor,
      color: json['color'].toString().getColor,
    );
  }
}

List<Transaction> transactions = [
  new Transaction(
    id: 1,
    type: 'Transfert d\'argent',
    iconPath: ICON_SEND,
    iconColor: AppColor.mainColor,
    color: HexColor('#DCDFFF'),
  ),
  new Transaction(
    id: 2,
    type: 'Achat de crédit téléphonique',
    iconPath: ICON_CALL,
    iconColor: HexColor('#F2994A'),
    color: HexColor('#FFF3E8'),
  ),
  // new Transaction(
  //   id: 3,
  //   type: 'Paiement des factures',
  //   iconPath: ICON_PAPER,
  //   color: green1,
  // ),
  // new Transaction(
  //   id: 4,
  //   type: 'Opérations bancaires',
  //   iconPath: ICON_WALLET,
  //   color: red,
  // ),
  // new Transaction(
  //   id: 5,
  //   type: 'Paiement marchant',
  //   iconPath: 'assets/icons/Work.svg',
  //   color: blue1,
  // ),
];
