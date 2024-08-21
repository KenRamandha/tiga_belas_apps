import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final navigator = Navigator.of(context);
            await FirebaseAuth.instance.signOut();
            unawaited(
              navigator.pushNamedAndRemoveUntil(
                '/',
                (route) => false,
              ),
            );
          },
          child: const Text('Keluar'),
        ),
      ),
    );
  }
}
