import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../authentication/authentication_screen.dart';
import '../landing/landing_screen.dart';
import '../todo_list/todo_list_screen.dart';

RouteMap buildRoutes({required bool isLoggedIn}) {
  return RouteMap(
    routes: {
      "/": (_) => const MaterialPage(child: LandingScreen()),
      if (isLoggedIn)
        "/todos": (_) => const MaterialPage(child: TodoListScreen())
      else
        "/login": (_) => const MaterialPage(child: AuthenticationScreen())
    },
    onUnknownRoute: (_) => const Redirect("/"),
  );
}
