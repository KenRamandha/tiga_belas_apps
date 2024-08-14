import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_default.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_obsecure.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextInputSignDefault(
          controller: emailController,
          content: "Email",
        ),
        SizedBox(height: context.width * .05),
        TextInputSignObsecure(
          controller: passwordController,
          content: "password",
        ),
      ],
    );
  }
}
