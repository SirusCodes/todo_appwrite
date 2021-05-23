import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:todo_appwrite/landing/landing_screen.dart';
import 'package:todo_appwrite/todo_list/todo_list_screen.dart';

final routeProvider = StateNotifierProvider<RouteProvider, RouteMap>((ref) {
  return RouteProvider();
});

class RouteProvider extends StateNotifier<RouteMap> {
  RouteProvider() : super(_initialRoute());

  static const bool _loggedIn = true;

  static RouteMap _initialRoute() {
    return RouteMap(
      routes: {
        "/": (_) => const MaterialPage(child: LandingScreen()),
        if (_loggedIn)
          "/todos": (_) => const MaterialPage(child: TodoListScreen()),
      },
      onUnknownRoute: (_) => const Redirect("/"),
    );
  }
}
