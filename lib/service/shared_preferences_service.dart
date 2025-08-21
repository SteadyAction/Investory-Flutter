import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._();

  static final instance = SharedPreferencesService._();

  final _previouslyLaunchedAppVersionNumberKey = "previously_launched_app_version_number";
  final _hapticFeedbackEnabledKey = "haptic_feedback_enabled";
  final _sharedPreferenceIdKey = "shared_preference_id";

  late SharedPreferences? _internalInstance;

  Future<void> load() async {
    _internalInstance = await SharedPreferences.getInstance();

    if (getSharedPreferencesId() == null) { 
      final now = DateTime.now().microsecondsSinceEpoch.toString();
      setSharedPreferencesId(now);
    }
  }

  void setSharedPreferencesId(String id) {
    _internalInstance?.setString(_sharedPreferenceIdKey, id);
  }

  String? getSharedPreferencesId() {
    return _internalInstance?.getString(_sharedPreferenceIdKey);
  }

  void setPreviouslyLaunchedAppVersionNumber(int appVersionNumber) {
    _internalInstance?.setInt(_previouslyLaunchedAppVersionNumberKey, appVersionNumber);
  }

  int getPreviouslyLaunchedAppVersionNumber() {
    return _internalInstance?.getInt(_previouslyLaunchedAppVersionNumberKey) ?? -1;
  }

  void setHapticFeedbackEnabled(bool enabled) {
    _internalInstance?.setBool(_hapticFeedbackEnabledKey, enabled);
  }

  bool getHapticFeedbackEnabled() {
    return _internalInstance?.getBool(_hapticFeedbackEnabledKey) ?? true;
  }
}

