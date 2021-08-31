import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemDrawer extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function() onTaped;

  const ItemDrawer({
    Key? key,
    required this.iconPath,
    required this.text,
    required this.onTaped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(iconPath),
      horizontalTitleGap: 0,
      minVerticalPadding: 0,
      title: Text(text),
      dense: true,
      onTap: onTaped,
    );
  }
}
