import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:routemaster/routemaster.dart';

import 'authentication/authentication_provider.dart';
import 'utils/routing.dart';
import 'utils/themes.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final isLoggedIn = watch(authProvider);

    return ScreenUtilInit(
      builder: () => MaterialApp.router(
        routeInformationParser: const RoutemasterParser(),
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (_) => buildRoutes(isLoggedIn: isLoggedIn),
        ),
        title: 'Flutter Demo',
        theme: appTheme(),
      ),
    );
  }
}
