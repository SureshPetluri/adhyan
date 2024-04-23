
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool onCreateTap = true;
  double _containerPosition = 0.0;

  void signIncontainer() {
    setState(() {
      onCreateTap = !onCreateTap;
      _containerPosition = onCreateTap ? 0.0 : 400.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 800,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Colors.cyan,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                right: _containerPosition,
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.all(50),
                  child: onCreateTap ? SignInForm() : SignUpForm(),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                curve: Curves.decelerate,
                left: _containerPosition,
                child: AnimatedContainer(
                  width: 400,
                  height: 500,
                  padding: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                      borderRadius: onCreateTap
                          ? const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )
                          : const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffc33764),
                          Color(0xff1d2671),
                        ],
                      )
                    // color: onCreateTap ? Colors. : Colors.cyan,
                  ),
                  duration: const Duration(seconds: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        onCreateTap ? "Welcome, User !" : "Welcome",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Enter your personal details to use all of site \nfeatures",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 40),
                      TextButton(
                        onPressed: signIncontainer,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(width: 1.0, color: Colors.white),
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          onCreateTap ? 'SIGN UP' : 'SIGN IN',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Create Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'or use your email for registration',
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ),
        const SizedBox(height: 30),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 30),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 30),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 40),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Sign Up'),
          ),
        ),
      ],
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Center(
          child: Text(
            'or use your email password',
            style: TextStyle(fontSize: 13, color: Colors.black),
          ),
        ),
        const SizedBox(height: 30),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 30),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 20),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text('Forget Password?'),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Sign In'),
          ),
        ),
      ],
    );
  }
}