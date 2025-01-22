import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDnGMwJYzsOp4_7WxC8CiN0Y4XBk-gNomc",
          authDomain: "br-sma.firebaseapp.com",
          projectId: "br-sma",
          storageBucket: "br-sma.appspot.com",
          messagingSenderId: "787190721610",
          appId: "1:787190721610:web:57921c0bf2523985274ab3",
          measurementId: "G-1MV3HFZN78",
        ),
      );
    } else if (Platform.isIOS) {
      await Firebase.initializeApp();
    }
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDnGMwJYzsOp4_7WxC8CiN0Y4XBk-gNomc",
        authDomain: "br-sma.firebaseapp.com",
        projectId: "br-sma",
        storageBucket: "br-sma.appspot.com",
        messagingSenderId: "787190721610",
        appId: "1:787190721610:web:57921c0bf2523985274ab3",
        measurementId: "G-1MV3HFZN78",
      ),
    );
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class AppColors {
  static const Color backgroundColor = Color(0xFFFFCC16); // Yellow
  static const Color formBackgroundColor = Colors.white; // White
  static const Color buttonColor = Color(0xFFFFCC16); // Yellow button
  static const Color textColor = Colors.black; // Black text
  static const Color accentColor = Colors.orange; // Orange text
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              children: [
                Expanded(flex: 1, child: LoginForm()),
                Expanded(flex: 1, child: ImageSlider()),
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ImageSlider(),
                  LoginForm(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'assets/images/img.png',
      'assets/images/img1.png',
      'assets/images/img2.png',
      'assets/images/img4.png',
      'assets/images/img5.png',
    ];

    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: PageView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) => Image.asset(
                images[index],
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false; // Added for password visibility toggle

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // Custom field names in Firestore
      const String emailField = "user_name"; // Replace with your custom field name
      const String passwordField = "user_password"; // Replace with your custom field name

      // Query Firestore
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('User') // Your Firestore collection
          .where(emailField, isEqualTo: _emailController.text.trim())
          .where(passwordField, isEqualTo: _passwordController.text.trim())
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Successful login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login successful!')),
        );

        // Navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Invalid credentials
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: const BoxDecoration(
        color: AppColors.formBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Text('Log in to SMA', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible, // Toggle password visibility
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isLoading ? null : _login,
            child: _isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Log In'),
          ),
        ],
      ),
    );
  }
}
