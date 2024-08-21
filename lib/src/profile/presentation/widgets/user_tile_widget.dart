import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.width * .05,
        vertical: context.width * .02,
      ),
      child: ListTile(
        tileColor: Colors.grey.withOpacity(.1),
        leading: Image.asset(
          icon,
          height: context.width * .06,
          width: context.width * .06,
          fit: BoxFit.contain,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: context.textDescriptionLarge,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(IconlyBold.arrow_right_2),
        ),
      ),
    );
  }
}
