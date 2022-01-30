import 'package:flutter/material.dart';
import 'package:leand_bloc/presentations/screems/home_screen.dart';

class AppRouter {
  Route? onGenereteRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: "Home Screen", color: Colors.purple));

      case "/second":
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: "Second Screen", color: Colors.green));

      case "/third":
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: "Third Screen", color: Colors.pink));

      default:
        return null;
    }
  }
}
