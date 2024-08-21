import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiga_belas_apps/core/common/app/providers/user_provider.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/colours.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';
import 'package:tiga_belas_apps/core/utils/core_utils.dart';
import 'package:tiga_belas_apps/src/auth/data/models/user_model.dart';
import 'package:tiga_belas_apps/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/sign_up_form.dart';
import 'package:tiga_belas_apps/src/dashboard/presentation/views/dashboard_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const routeName = '/sign_up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundBlue,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is SignedUp) {
            context.read<AuthBloc>().add(
                  SignInEvent(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
          } else if (state is SignedIn) {
            context.read<UserProvider>().initUser(state.user as LocalUserModel);
            Navigator.pushReplacementNamed(context, DashboardView.routeName);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
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
                        passwordController: passwordController,
                        passwordConfirmController: passwordConfirmController,
                        formKey: formKey,
                      ),
                      SizedBox(height: context.width * .1),
                      if (state is AuthLoading)
                        const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      else
                        SizedBox(
                          width: context.width,
                          child: ElevatedButton(
                            onPressed: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              FirebaseAuth.instance.currentUser?.reload();
                              if (formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      SignUpEvent(
                                        email: emailController.text.trim(),
                                        name: usernameController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                      ),
                                    );
                              }
                            },
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
          );
        },
      ),
    );
  }
}
