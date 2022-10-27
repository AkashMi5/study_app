import 'package:flutter/material.dart';
import 'package:study_app/screens/create_test/view/create_test_view.dart';
import 'package:study_app/screens/home/view/home_view.dart';
import 'package:study_app/screens/splash/view/splash_view.dart';

mixin Routes {
  static const String splash = '/';
  static const String home = 'home';
  static const String createTest = 'create_test';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return MaterialPageRoute<SplashView>(
            settings: const RouteSettings(name: splash),
            builder: (BuildContext buildContext) => const SplashView());

      case home:
        return MaterialPageRoute<HomeView>(
            settings: const RouteSettings(name: home),
            builder: (BuildContext buildContext) => const HomeView());

      case createTest:
        return MaterialPageRoute<CreateTestView>(
            settings: const RouteSettings(name: createTest),
            builder: (BuildContext buildContext) => const CreateTestView());

      default:
        return MaterialPageRoute<HomeView>(
            settings: const RouteSettings(name: home),
            builder: (BuildContext buildContext) => const HomeView());
    }
  }
}
