import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_proper/routes/auth.dart';
import 'package:goo_proper/ui/screens/main/first_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final _appRoutes =
    GoRouter(navigatorKey: navigatorKey, initialLocation: "/splash", routes: [
  GoRoute(path: "/splash", builder: (context, state) => const FirstScreen()),
  ...authRoutes,
]);

final appRouterprovider = Provider((ref) => _appRoutes);
