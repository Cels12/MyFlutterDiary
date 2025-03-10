// pages/login_page.dart
import 'package:flutter/material.dart';
import '../sevices/auth_service.dart';
import 'homepage.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = '';
  bool isLoading = false;

  /// Fungsi login
  Future<void> login() async {
    setState(() => isLoading = true);

    final result = await _authService.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    if (result != null) {
      setState(() => message = result); // Tampilkan error jika gagal login
    } else {
      setState(() => message = "Login berhasil!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (message.isNotEmpty)
              Text(message, style: const TextStyle(color: Colors.red)),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : login,
              child:
                  isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Login'),
            ),
            TextButton(
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  ),
              child: const Text("Belum punya akun? Daftar"),
            ),
          ],
        ),
      ),
    );
  }
}
