import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_default.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    required this.usernameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.passwordConfirmController,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;

  @override
  Widget build(BuildContext context) {
    return TextInputSignDefault(
      controller: emailController,
      content: "Email",
    );
  }
}
