import 'package:firee/features/login_screen/persentation/view/login_screen_widget.dart/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: LoginScreenBody(),
    );
  }
}
