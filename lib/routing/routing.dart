import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/home.dart';

part 'routing.g.dart';

@TypedGoRoute<HomePageRoute>(path: '/')
@immutable
class HomePageRoute extends GoRouteData with _$HomePageRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

final router = GoRouter(routes: $appRoutes);
