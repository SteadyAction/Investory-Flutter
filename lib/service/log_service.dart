import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/constants.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:flutter/foundation.dart';
import 'package:investory/service/auth_service.dart';
import 'package:investory/service/build_service.dart';
import 'package:investory/service/platform_service.dart';


class LogService {
  LogService._();
  static final instance = LogService._();

  Amplitude? _internalInstance;

  Future<void> initialize() async {
    _internalInstance = Amplitude(
      Configuration(
        apiKey: "d2a07861c7d82c810f29d21fb20a7e8c",
        serverZone: ServerZone.us,
      )
    );
    await _internalInstance?.isBuilt;
  }

  void printDebug(String? message) {
    if (kDebugMode) {
      print("Print: $message");
    }
  }

  Future<void> logError(String eventName, {Map<String, dynamic> data=const{}}) async {
    if (kDebugMode) {
      print("Error: $eventName");
    }
    final eventProperties = _commonData(data);
    eventProperties["isError"] = true;
    await _internalInstance?.track(BaseEvent(eventName, eventProperties: eventProperties));
  }

  Future<void> logEvent(String eventName, {Map<String, dynamic> data=const{}}) async {
    if (kDebugMode) {
      print("Event: $eventName");
    }
    
    final eventProperties = _commonData(data);
    await _internalInstance?.track(BaseEvent(eventName, eventProperties: eventProperties));
  }

  Map<String, dynamic> _commonData(Map<String, dynamic> rawData) {
    var result = <String, dynamic>{};
    result.addAll(rawData);
    result.addAll({
      "userId": AuthService.instance.userId,
      "platform": PlatformService.platformName,
      "isFirstTimeAppLaunch": BuildService.instance.isFirstTimeAppLaunch(),
    });
    return result;
  }

  Future<void> setUserId(String? userId) async {
    await _internalInstance?.setUserId(userId);
  } 
}
  
