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
import 'package:tiga_belas_apps/src/auth/presentation/views/forget_password_view.dart';
import 'package:tiga_belas_apps/src/auth/presentation/views/sign_up_view.dart';
import 'package:tiga_belas_apps/src/auth/presentation/widgets/sign_in_form.dart';
import 'package:tiga_belas_apps/src/dashboard/presentation/views/dashboard_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const routeName = '/sign_in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                        'Sign In',
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
                            'Login below or ',
                            style: TextStyle(
                              fontSize: context.textDescriptionMedium,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                SignUpView.routeName,
                              );
                            },
                            child: Text(
                              'Create Account',
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
                      SignInForm(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),
                      SizedBox(height: context.width * .05),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ForgetPasswordView.routeName,
                          );
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: context.textDescriptionMedium,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                                      SignInEvent(
                                        email: emailController.text.trim(),
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
                              "Sign In",
                              style: TextStyle(
                                fontSize: context.textDescriptionMedium,
                                color: Colours.backgroundBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      SizedBox(height: context.width * .1),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'or login with',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: context.textDescriptionMedium,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.width * .1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: const BorderSide(
                                    color: Colors.white, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: Image.asset(
                                MediaRes.iconGoogle,
                                height: context.width * .05,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: context.width * .05),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                side: const BorderSide(
                                    color: Colors.white, width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: Image.asset(
                                MediaRes.iconApple,
                                height: context.width * .06,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
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
