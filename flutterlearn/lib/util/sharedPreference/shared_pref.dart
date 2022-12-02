import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static final SharedPref prefs = SharedPref._internal();
  SharedPref._internal();
  factory SharedPref() => prefs;

  SharedPreferences? _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  setBool({required String key, required bool value}) {
    _sharedPrefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    return _sharedPrefs?.getBool(key);
  }
}

class PrefHelper {
  static bool? get isTutorialViewed {
    return SharedPref.prefs.getBool(PrefHelperKey.isTutorialViewed);
  }

  static setIsTutorialViewed(bool value) {
    SharedPref.prefs.setBool(key: PrefHelperKey.isTutorialViewed, value: value);
  }
}

class PrefHelperKey {
  static const String isTutorialViewed = "is_tutorial_viewed";
}
