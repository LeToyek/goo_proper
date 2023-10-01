import 'package:go_router/go_router.dart';
import 'package:goo_proper/ui/screens/auth/login_screen.dart';

final authRoutes = [
  GoRoute(
      path: LoginScreen.route,
      builder: (context, state) => const LoginScreen()),
];
