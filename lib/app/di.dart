import 'package:clean_architecture_with_mvvm/app/app_prefs.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  //shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);//lazy singleton here means we have only one sharedpref instance in whole app

  //app prefs instance/lazy singleton her
  instance.registerLazySingleton<AppPrefrences>(() => AppPrefrences(instance()));
  // TODO: implement init
}