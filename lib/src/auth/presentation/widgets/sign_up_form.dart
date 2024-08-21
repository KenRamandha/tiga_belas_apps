import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_default.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_obsecure.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordConfirmController,
    required this.formKey,
    super.key,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputSignDefault(
            controller: widget.usernameController,
            content: "Full Name",
          ),
          SizedBox(height: context.width * .05),
          TextInputSignDefault(
            controller: widget.emailController,
            content: "Email",
          ),
          SizedBox(height: context.width * .05),
          TextInputSignObsecure(
            controller: widget.passwordController,
            content: "Password",
          ),
          SizedBox(height: context.width * .05),
          TextInputSignObsecure(
            controller: widget.passwordConfirmController,
            content: "Password Confirm",
          ),
        ],
      ),
    );
  }
}
