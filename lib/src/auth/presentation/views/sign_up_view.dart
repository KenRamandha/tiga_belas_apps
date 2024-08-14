import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/colours.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();
    final passwordConfirmController = TextEditingController();

    return Scaffold(
      backgroundColor: Colours.backgroundBlue,
      body: SingleChildScrollView(
        child: Column(
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: context.textTitleMedium,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.width * .01),
                  Row(
                    children: [
                      Text(
                        'Enter your account details below or ',
                        style: TextStyle(
                          fontSize: context.textDescriptionMedium,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: context.textDescriptionMedium,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.width * .1),
                  SignUpForm(
                    usernameController: usernameController,
                    emailController: emailController,
                    phoneController: phoneController,
                    passwordController: passwordController,
                    passwordConfirmController: passwordConfirmController,
                  ),
                  SizedBox(height: context.width * .1),
                  SizedBox(
                    width: context.width,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: context.textDescriptionMedium,
                          color: Colours.backgroundBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.width * .1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
