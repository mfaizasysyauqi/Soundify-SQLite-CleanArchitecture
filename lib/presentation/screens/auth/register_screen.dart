// lib/presentation/screens/auth/register_screen.dart
import 'package:flutter/material.dart';
import 'package:soundify/core/styles/colors.dart';
import 'package:soundify/core/styles/text_styles.dart';
import 'package:soundify/presentation/screens/auth/login_screen.dart';
import 'package:soundify/presentation/widgets/common/custom_button.dart';
import 'package:soundify/presentation/widgets/common/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isHoveredEmail = false;
  bool _isHoveredPassword = false;
  bool _isHoveredFullName = false;
  bool _isHoveredUsername = false;
  bool _isHoveredSignUpButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            _buildLogo(),
            _buildRegisterForm(),
            const Spacer(),
            _buildLoginPrompt(),
          ],
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

  Widget _buildRegisterForm() {
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
        CustomTextField(
          controller: fullNameController,
          hintText: 'Enter your full name',
          isHovered: _isHoveredFullName,
          onHover: (value) => setState(() => _isHoveredFullName = value),
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: usernameController,
          hintText: 'Enter your username',
          isHovered: _isHoveredUsername,
          onHover: (value) => setState(() => _isHoveredUsername = value),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildSignUpButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return CustomButton(
      text: 'Sign up',
      onPressed: () => () {},
      isHovered: _isHoveredSignUpButton,
      onHover: (value) => setState(() => _isHoveredSignUpButton = value),
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Sudah punya akun?",
          style: TextStyle(color: primaryTextColor),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: const Text(
            "Login",
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
