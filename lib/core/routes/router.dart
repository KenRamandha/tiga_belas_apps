import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiga_belas_apps/core/common/views/page_under_construction.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/services/injection_container.dart';
import 'package:tiga_belas_apps/src/auth/data/models/user_model.dart';
import 'package:tiga_belas_apps/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:tiga_belas_apps/src/auth/presentation/views/forget_password_view.dart';
import 'package:tiga_belas_apps/src/auth/presentation/views/sign_in_view.dart';
import 'package:tiga_belas_apps/src/auth/presentation/views/sign_up_view.dart';
import 'package:tiga_belas_apps/src/dashboard/presentation/views/dashboard_view.dart';
import 'package:tiga_belas_apps/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:tiga_belas_apps/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:tiga_belas_apps/src/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageBuilder(
        (context) {
          if (prefs.getBool(kFirstTimerKey) ?? true) {
            return BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingView(),
            );
          } else if (sl<FirebaseAuth>().currentUser != null) {
            final user = sl<FirebaseAuth>().currentUser!;
            final localUser = LocalUserModel(
              uid: user.uid,
              email: user.email ?? '',
              points: 0,
              fullName: user.displayName ?? '',
            );
            context.userProvider.initUser(localUser);
            return const DashboardView();
          }
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignInView(),
          );
        },
        settings: settings,
      );
    case SignInView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignInScreen(),
        ),
        settings: settings,
      );
    case SignUpView.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignUpView(),
        ),
        settings: settings,
      );
    case DashboardView.routeName:
      return _pageBuilder(
        (_) => const DashboardView(),
        settings: settings,
      );
    case ForgetPasswordView.routeName:
      return _pageBuilder(
        (_) => const ForgetPasswordView(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
