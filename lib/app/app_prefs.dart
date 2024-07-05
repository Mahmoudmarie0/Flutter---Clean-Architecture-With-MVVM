import 'package:clean_architecture_with_mvvm/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPrefrences {
  SharedPreferences sharedPreferences;
  AppPrefrences(this.sharedPreferences);

  Future<String> getAPPLanguage() async {
    String? language = sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
