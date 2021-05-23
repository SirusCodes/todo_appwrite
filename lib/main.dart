import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'utils/routing.dart';
import 'utils/themes.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final routes = watch(routeProvider);
    return MaterialApp.router(
      routeInformationParser: RoutemasterParser(),
      routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
      title: 'Flutter Demo',
      theme: appTheme,
    );
  }
}
