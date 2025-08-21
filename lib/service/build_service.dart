import 'package:investory/service/shared_preferences_service.dart';

class BuildService {
  BuildService._();
  static final instance = BuildService._();

  final appVersion = "2025.11.01";
  final appVersionNumber = 1;
  
  int? savedPreviouslyLaunchedAppVersionNumber;

  void updatePreviouslyLaunchedAppVersionNumber() {
    if (savedPreviouslyLaunchedAppVersionNumber == null) {
      savedPreviouslyLaunchedAppVersionNumber = getPreviouslyLaunchAppVersionNumber();
      SharedPreferencesService.instance.setPreviouslyLaunchedAppVersionNumber(appVersionNumber);
    }
  }

  int getPreviouslyLaunchAppVersionNumber() {
    if (savedPreviouslyLaunchedAppVersionNumber != null) {
      return savedPreviouslyLaunchedAppVersionNumber!;
    }
    return SharedPreferencesService.instance.getPreviouslyLaunchedAppVersionNumber();
  }

  bool isFirstTimeAppLaunch() {
    return getPreviouslyLaunchAppVersionNumber() == -1;
  }
}