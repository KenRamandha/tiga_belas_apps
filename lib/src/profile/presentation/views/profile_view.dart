import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/src/profile/presentation/widgets/user_data_widget.dart';
import 'package:tiga_belas_apps/src/profile/presentation/widgets/user_info_widget.dart';
import 'package:tiga_belas_apps/src/profile/presentation/widgets/user_setting_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const UserInfoWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: context.height * .02),
            const UserDataWidget(),
            SizedBox(height: context.height * .02),
            const UserSettingWidget(),
            SizedBox(height: context.height * .02),
          ],
        ),
      ),
    );
  }
}
