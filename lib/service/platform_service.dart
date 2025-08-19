import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PlatformService {
  PlatformService._();
  static final instance = PlatformService._();

  static bool get isWeb {
    return kIsWeb;
  }

  static bool get isIOSNative {
    if (kIsWeb) {
      return false;
    }
    return defaultTargetPlatform == TargetPlatform.iOS;
  }

  static bool get isAndroidNative {
    if (kIsWeb) {
      return false;
    }
    return defaultTargetPlatform == TargetPlatform.android;
  }

  static bool get isMobileWeb {
    if (!kIsWeb) return false;
  
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('mobile') || userAgent.contains('android') || userAgent.contains('iphone');
  }

  static bool get isDesktopWeb {
    if (!kIsWeb) return false;

    final userAgent = html.window.navigator.userAgent.toLowerCase();
                    
    final isDesktopOS = userAgent.contains('windows') || 
                      userAgent.contains('macintosh') || 
                      userAgent.contains('linux');
                      
    return !isMobileWeb && isDesktopOS;
  }

  static bool isWebSizeMedium(BuildContext context) {
    if (!kIsWeb) return false;
 
    final size = MediaQuery.of(context).size;
    return size.width >= 768 && size.width < 1024;
  }

  static bool isWebSizeLarge(BuildContext context) {
    if (!kIsWeb) return false;
    
    final size = MediaQuery.of(context).size;
    return size.width >= 1024;
  }

  static bool isWebSizeMediumOrLarge(BuildContext context) {
    if (!kIsWeb) return false;
 
    final size = MediaQuery.of(context).size;
    return size.width >= 768;
  }

  static String get platformName {
    if (isAndroidNative) { return "android"; }
    else if (isIOSNative) { return "ios"; }
    else {
      if (isDesktopWeb) { return "desktop-web";}
      else if (isMobileWeb) { return "mobile-web"; }
      else { return "web"; }
    }
  }
}
