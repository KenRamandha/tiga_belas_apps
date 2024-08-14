import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_default.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_obsecure.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputSignDefault(
          controller: usernameController,
          content: "Username",
        ),
        SizedBox(height: context.width * .05),
        TextInputSignDefault(
          controller: emailController,
          content: "Email",
        ),
        SizedBox(height: context.width * .05),
        TextInputSignDefault(
          controller: phoneController,
          content: "Phone Number",
        ),
        SizedBox(height: context.width * .05),
        TextInputSignObsecure(
          controller: passwordController,
          content: "Password",
        ),
        SizedBox(height: context.width * .05),
        TextInputSignObsecure(
          controller: passwordConfirmController,
          content: "Password Confirm",
        ),
      ],
    );
  }
}
