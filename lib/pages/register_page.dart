import 'package:chatin/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onPressed;

  RegisterPage({super.key, required this.onPressed});

  // register method
  void register(BuildContext context) async {
    // get auth service
    final authService = AuthService();

    // password match check -> create user
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await authService.createUserWithEmailAndPassword(
            _emailController.text, _passwordController.text);
      } catch (e) {
        // showDialog(
        //   context: context,
        //   builder: (context) => AlertDialog(
        //     title: Text(e.toString()),
        //   ),
        // );
      }
    } else {
      // if passwords do not match -> alert the user to fix it
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Passwords do not match'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add a logo here
              Icon(Icons.message,
                  size: 60, color: Theme.of(context).colorScheme.primary),

              // Welcome back message
              Text(
                "Let's create an account",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 16),
              ),

              const SizedBox(height: 25),

              // Email TextField
              MyTextField(
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              // Password TextField
              MyTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 10),

              // Confirm Password TextField
              MyTextField(
                hintText: 'Confirm password',
                obscureText: true,
                controller: _confirmPasswordController,
                keyboardType: TextInputType.text,
              ),

              const SizedBox(height: 25),

              // Login Button
              MyButton(
                text: 'Register',
                onTap: () => register(context),
              ),

              // Register Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                  TextButton(
                      onPressed: onPressed,
                      child: Text('Login Now',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
