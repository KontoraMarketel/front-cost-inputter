import 'package:flutter/material.dart';

import 'routing/routing.dart';
import 'ui/core/theme/theme.dart';

class MarketelApp extends StatefulWidget {
  const MarketelApp({super.key});

  @override
  State<MarketelApp> createState() => _MarketelAppState();
}

class _MarketelAppState extends State<MarketelApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
