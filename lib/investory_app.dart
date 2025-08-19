import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:investory/module/splash/splash_module.dart';
import 'package:investory/service/platform_service.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class InvestoryApp extends StatelessWidget {

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  const InvestoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      // systemNavigationBarColor: SPColor.clear,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);    

    return ShowCaseWidget(
      builder: (context) => _materialApp()
    );
  }

  MaterialApp _materialApp() {
    // if (PlatformService.isWeb) {
      // return MaterialApp.router(
      //   scrollBehavior: SoulplayAppScrollBehavior(),
      //   routerConfig: RouterService.instance.router,
      //   debugShowCheckedModeBanner: false,
      //   localizationsDelegates: [
      //     GlobalMaterialLocalizations.delegate,
      //     GlobalWidgetsLocalizations.delegate,
      //     GlobalCupertinoLocalizations.delegate,
      //   ],
      //   supportedLocales: [
      //     Locale('en'),
      //   ],
      //   theme: ThemeData(
      //     brightness: Brightness.light,
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //     fontFamily: "Inter",
      //   ),
      //   darkTheme: ThemeData(
      //     brightness: Brightness.dark,
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //     fontFamily: "Inter",
      //   ),
      //   themeMode: ThemeMode.system,
      // );
    // } else {
      return MaterialApp(
        scrollBehavior: InvestoryAppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fontFamily: "Inter",
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fontFamily: "Inter",
        ),
        themeMode: ThemeMode.system,
        initialRoute: "SplashModule",
        routes: {
          "SplashModule": (context) => SplashModule(SplashModuleInputData()),
        }
      );
    // }
  }
}

class InvestoryAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}