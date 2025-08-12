import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'config/di/di.dart';
import 'marketel_app.dart';

Future<void> main() async {
  configureDependencies();

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();
    usePathUrlStrategy();
    runApp(const MarketelApp());
  }, (error, stackTrace) => getIt<Talker>().handle(error, stackTrace));
}
