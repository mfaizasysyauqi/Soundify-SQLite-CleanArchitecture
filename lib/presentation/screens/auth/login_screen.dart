// lib/presentation/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/screens/auth/register_screen.dart';
import 'package:soundify/presentation/screens/main_screen.dart';
import 'package:soundify/presentation/widgets/common/custom_button.dart';
import 'package:soundify/presentation/widgets/common/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isHoveredEmail = false;
  bool _isHoveredPassword = false;
  bool _isHoveredLoginButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Spacer(),
              _buildLogo(),
              _buildLoginForm(),
              const Spacer(),
              _buildSignUpPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Column(
      children: [
        Center(
          child: Text(
            'Soundify',
            style: TextStyle(
              fontSize: 64,
              color: secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        const SizedBox(height: 20),
        CustomTextField(
          controller: emailController,
          hintText: 'Enter your email',
          isHovered: _isHoveredEmail,
          onHover: (value) => setState(() => _isHoveredEmail = value),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: passwordController,
          hintText: 'Enter your password',
          obscureText: true,
          isHovered: _isHoveredPassword,
          onHover: (value) => setState(() => _isHoveredPassword = value),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildLoginButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return CustomButton(
      text: 'Login',
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MainScreen(
           
            ),
          ),
        );
      },
      isHovered: _isHoveredLoginButton,
      onHover: (value) => setState(() => _isHoveredLoginButton = value),
    );
  }

  Widget _buildSignUpPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Belum punya akun?",
          style: TextStyle(color: primaryTextColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: const Text(
            "Sign up",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
