import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_default.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_obsecure.dart';

class SignInForm extends StatefulWidget {
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
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputSignDefault(
            controller: widget.emailController,
            content: "Email",
          ),
          SizedBox(height: context.width * .05),
          TextInputSignObsecure(
            controller: widget.passwordController,
            content: "password",
          ),
        ],
      ),
    );
  }
}
