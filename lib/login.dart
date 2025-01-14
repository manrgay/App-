import 'package:flutter/material.dart';
import 'home_page.dart';  // Import the HomePage
import 'sigup.dart';  // Import หน้า SignUp

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _email = '';
  String _password = '';

  void _handleLogin() {
    // Get the email and password from the controllers
    _email = _emailController.text.trim();
    _password = _passwordController.text.trim();

    // Basic validation (now using dog@gmail.com and 1234 as valid credentials)
    if (_email == 'dog@gmail.com' && _password == '1234') {
      // If the credentials are correct, navigate to the HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 40.0),

            // Logo
            Image.asset(
              'assets/logo.png',
              height: 200,



            ),
            SizedBox(height: 20.0),

            // Title
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 20.0),

            // Subtitle


            // Social Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLoginButton(icon: Icons.facebook, color: Colors.blue),
                SizedBox(width: 16.0),
                SocialLoginButton(icon: Icons.apple, color: Colors.black),
                SizedBox(width: 16.0),
                SocialLoginButton(icon: Icons.email, color: Colors.red),
              ],
            ),
            SizedBox(height: 20.0),

            // Separator
            Text(
              'or',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25.0,  // เพิ่มขนาดตัวอักษร
              ),
            ),

            SizedBox(height: 15.0),

            // Email Field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Password Field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Sign Up Button
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _handleLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 80.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 20.0),

            // Already have an account (plain text) and Sign Up link in the same row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to Sign Up page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // Dog Image - Use Spacer to push image to the bottom
            SizedBox(height: 15.0),
            Image.asset(
              'assets/004.png', // ใส่รูปสุนัขในโฟลเดอร์ assets
              height: 300, // ปรับขนาดให้เหมาะสม
              width: 300, // ปรับขนาดให้เหมาะสม
            ),
          ],
        ),
      ),
    );
  }
}

// Social Login Button Widget
class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  SocialLoginButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
