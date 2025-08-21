import 'package:flutter/services.dart';
import 'package:investory/extension/bool_extension.dart';
import 'package:investory/service/platform_service.dart';
import 'package:investory/service/shared_preferences_service.dart';

class HapticService {
    static void miniImpact() {
    if (SharedPreferencesService.instance.getHapticFeedbackEnabled()) {
      if (PlatformService.isWeb.not) {
          HapticFeedback.selectionClick();
      } 
    }
  }

  static void lightImpact() {
    if (SharedPreferencesService.instance.getHapticFeedbackEnabled()) {
      if (PlatformService.isWeb.not) {
        HapticFeedback.lightImpact();
      } 
    }
  }

  static void mediumImpact() {
    if (SharedPreferencesService.instance.getHapticFeedbackEnabled()) {
      if (PlatformService.isWeb) {
        HapticFeedback.mediumImpact();
      }
    }
  }
}