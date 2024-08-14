import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/common/widgets/text_input_field.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';

class TextInputSignDefault extends StatefulWidget {
  const TextInputSignDefault({
    required this.controller,
    required this.content,
    super.key,
  });

  final TextEditingController controller;
  final String content;

  @override
  State<TextInputSignDefault> createState() => _TextInputSignDefaultState();
}

class _TextInputSignDefaultState extends State<TextInputSignDefault> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.content,
          style: TextStyle(
            fontSize: context.textDescriptionMedium,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.width * .02),
        TextInputField(
          controller: widget.controller,
          hintText: widget.content,
          keyboardType: TextInputType.text,
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
