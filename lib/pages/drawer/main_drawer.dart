
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mypay/common/constants/assest_path.dart';
import 'package:mypay/pages/drawer/components/item_drawer.dart';
import 'package:mypay/utils/ui/app_color.dart';
import 'package:package_info/package_info.dart';

class MainDrawer extends StatelessWidget {
  final Function closeEndDrawer;

  const MainDrawer({Key? key, required this.closeEndDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 30.0, 0, 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SvgPicture.asset(APP_LOGO),
                Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 10.0),
                  icon: SvgPicture.asset(ICON_CLOSE),
                  onPressed: () {
                    closeEndDrawer();
                  },
                ),
              ],
            ),
          ),
          ItemDrawer(
            iconPath: ICON_WALLET,
            text: 'Choix des opérations',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          ItemDrawer(
            iconPath: ICON_PAPER_PLUS,
            text: 'Gérer les catégories',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          ItemDrawer(
            iconPath: ICON_NOTIFICATION,
            text: 'Notifications',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          ItemDrawer(
            iconPath: ICON_SETTING,
            text: 'Parametres',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          Divider(
            color: AppColor.gray6,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          ),
          ItemDrawer(
            iconPath: ICON_SHARE,
            text: 'Partager l’application',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          ItemDrawer(
            iconPath: ICON_PLAYSTORE,
            text: 'Donner nous 5',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          ItemDrawer(
            iconPath: ICON_MESSAGE,
            text: 'Contactez-nous',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          ItemDrawer(
            iconPath: ICON_INFO,
            text: 'A propos de l’App',
            onTaped: () {
              closeEndDrawer();
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (BuildContext _, AsyncSnapshot<PackageInfo> snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  return Text(
                    'Version ${snapshot.data!.version}',
                    style: TextStyle(color: AppColor.gray3),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
