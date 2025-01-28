import 'package:chatin/auth/auth_service.dart';
import 'package:chatin/components/my_button.dart';
import 'package:chatin/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  // email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// toggle between login and register page
  final void Function()? onPressed;

  LoginPage({super.key, required this.onPressed});

  // login method
  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    // try login
    try {
      await authService.signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(title: Text(e.toString())));
      // catch any errors
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
                'Welcome back!',
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

              // const SizedBox(height: 10),

              // // Forgot Password Button
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       TextButton(
              //           onPressed: () {},
              //           child: Text(
              //             'Forgot Password?',
              //             style: TextStyle(
              //               color: Colors.blue,
              //             ),
              //           )),
              //     ],
              //   ),
              // ),

              const SizedBox(height: 25),

              // Login Button
              MyButton(
                text: 'Login',
                onTap: () => login(context),
              ),

              // Register Now Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                  TextButton(
                      onPressed: onPressed,
                      child: Text('Register Now',
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
