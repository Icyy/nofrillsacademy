import 'package:flutter/material.dart';
import 'package:nofrillsacademy/pages/admin_control.dart'; // Adjust this import if necessary

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? errorMessage; // To display any error messages

  // Function to handle login
  void handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Simple validation for admin login
    if (username == 'admin' && password == 'admin') {
      // Navigate to AdminControlPanel if credentials are correct
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const AdminDashboard()), // Correctly using AdminControlPanel
      );
    } else {
      setState(() {
        errorMessage = 'Invalid username or password. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Admin Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Username TextField
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: true, // Hide password text
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Display error message if credentials are wrong
            if (errorMessage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              ),

            const SizedBox(height: 20),

            // Login Button
            ElevatedButton(
              onPressed: handleLogin,
              style: ElevatedButton.styleFrom(primary: Colors.black),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
