import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tiga_belas_apps/core/common/widgets/text_input_field.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';

class TextInputSignObsecure extends StatefulWidget {
  const TextInputSignObsecure({
    required this.controller,
    required this.content,
    super.key,
  });

  final TextEditingController controller;
  final String content;

  @override
  State<TextInputSignObsecure> createState() => _TextInputSignObsecureState();
}

class _TextInputSignObsecureState extends State<TextInputSignObsecure> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
            fontSize: context.textDescriptionMedium,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.width * .02),
        TextInputField(
          controller: widget.controller,
          hintText: 'Password',
          obscureText: obscurePassword,
          keyboardType: TextInputType.visiblePassword,
          suffixIcon: IconButton(
            onPressed: () => setState(() {
              obscurePassword = !obscurePassword;
            }),
            icon: Icon(
              obscurePassword ? IconlyLight.hide : IconlyLight.show,
              color: Colors.grey,
            ),
          ),
          colorEnabeledBorder: Colors.white,
          colorFocusedBorder: Colors.white,
          colorHint: Colors.white,
          fillColour: Colors.white.withOpacity(.1),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
