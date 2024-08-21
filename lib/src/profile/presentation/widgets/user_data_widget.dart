import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';
import 'package:tiga_belas_apps/src/profile/presentation/widgets/user_tile_widget.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * .05),
          child: Text(
            "User Data",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.textTitleSmall,
            ),
          ),
        ),
        const UserTileWidget(
          icon: MediaRes.iconEditProfile,
          title: "Edit Profile Information",
        ),
        const UserTileWidget(
          icon: MediaRes.iconChangePassword,
          title: "Change Password",
        ),
        const UserTileWidget(
          icon: MediaRes.iconVoucher,
          title: "Voucher",
        ),
        const UserTileWidget(
          icon: MediaRes.iconPoints,
          title: "Points",
        ),
      ],
    );
  }
}
