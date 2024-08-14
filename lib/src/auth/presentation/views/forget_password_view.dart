import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/colours.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/text_input_sign_default.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = '/forget_password';

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Colours.backgroundBlue,
      body: Stack(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.width * .2),
              Center(
                child: Image.asset(
                  width: context.width * .2,
                  MediaRes.logoTigaBelas,
                ),
              ),
              SizedBox(height: context.width * .1),
              Padding(
                padding: EdgeInsets.all(context.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: context.textTitleMedium,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: context.width * .01),
                    Text(
                      'Opps It happens to the best of us. Input your email address to fix the issue.',
                      style: TextStyle(
                        fontSize: context.textDescriptionMedium,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: context.width * .1),
                    TextInputSignDefault(
                      controller: emailController,
                      content: "Email",
                    ),
                    SizedBox(height: context.width * .1),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.width,
              padding: EdgeInsets.all(context.width * .05),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: context.textDescriptionMedium,
                    color: Colours.backgroundBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
