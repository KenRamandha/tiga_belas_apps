import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';
import 'package:tiga_belas_apps/src/profile/presentation/widgets/user_tile_widget.dart';

class UserSettingWidget extends StatelessWidget {
  const UserSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .05),
          child: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.textTitleSmall,
            ),
          ),
        ),
        const UserTileWidget(
          icon: MediaRes.iconNotification,
          title: "Notification",
        ),
        const UserTileWidget(
          icon: MediaRes.iconPrivacyPolicy,
          title: "Privacy Policy",
        ),
        const UserTileWidget(
          icon: MediaRes.iconLogOut,
          title: "Log Out",
        ),
      ],
    );
  }
}
