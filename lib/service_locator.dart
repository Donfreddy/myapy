import 'package:get_it/get_it.dart';
import 'package:mypay/config/themes/theme_change_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);

  locator.registerLazySingleton(() => ThemeChangeNotifier(locator()));
}
