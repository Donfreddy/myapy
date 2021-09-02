import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mypay/common/constants/app_constants.dart';
import 'package:mypay/common/constants/route_constants.dart';
import 'package:mypay/common/screenutil/screenutil.dart';
import 'package:mypay/config/routes/routes.dart';
import 'package:mypay/service_locator.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:pedantic/pedantic.dart';

const List<String> ref = [
  'Transport',
  'Repas',
  'Famille',
  'Cadeaux',
  'Reunion',
  'Autres',
]; // Raison du transfert

void main() async {
  // Call this first to make sure we can make other system level calls safely
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Hive
  final appDocumentDir = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  // Hive.registerAdapter();
  await Hive.openBox<bool>('settings');

  // Only portrait
  unawaited(
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  );

  // Init service locator
  unawaited(setupLocator());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();

    return MaterialApp(
      title: AppConstants.name,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: 'Josefin Sans',
      ),
      initialRoute: RouteList.initial,
      onGenerateRoute: generateRoute,
    );
  }
}
