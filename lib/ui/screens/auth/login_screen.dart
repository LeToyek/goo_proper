import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_proper/services/auth_services.dart';
import 'package:goo_proper/ui/widgets/plain_card.dart';
import 'package:goo_proper/utils/constants.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String route = '/login';
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final AuthServices _authServices = AuthServices.instance;
  @override
  void initState() {
    // TODO: implement initState
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void signInWithGoogle() {
    _authServices.signInWithGoogle();
    context.go("/splash");
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const white = Colors.white;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                appName,
                style: textTheme.displayLarge!
                    .apply(color: white, fontWeightDelta: 4),
              ),
              const SizedBox(
                height: 43,
              ),
              const SizedBox(height: 16),
              Form(
                  child: Column(children: [
                _buildInputForm(context,
                    hint: "Email", controller: _usernameController),
                const SizedBox(height: 16),
                _buildInputForm(context,
                    hint: "Password", controller: _passwordController),
                const SizedBox(height: 16),
                PlainCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: textTheme.bodyLarge!.apply(
                            fontWeightDelta: 2, color: colorScheme.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                    onPressed: () {},
                    child: Text("Sign Up",
                        style: textTheme.bodyMedium!.apply(color: white))),
                const SizedBox(height: 16),
                PlainCard(
                  onTap: signInWithGoogle,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/icons/google.png",
                        width: 24,
                        height: 24,
                      ),
                      Text(
                        "Login with Google",
                        style: textTheme.bodyLarge!.apply(
                            fontWeightDelta: 2, color: colorScheme.primary),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                )
              ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputForm(BuildContext context,
      {required TextEditingController controller,
      required String hint,
      bool obscureText = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: colorScheme.primary,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        // label: const Text("Label"),
        // floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: TextStyle(
          color: colorScheme.primary,
        ),

        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        hintText: hint,
        filled: true,
        fillColor: Colors.blue[50],
      ),
    );
  }
}
