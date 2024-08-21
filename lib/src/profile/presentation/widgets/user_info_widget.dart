import 'package:flutter/material.dart';
import 'package:tiga_belas_apps/core/extensions/context_extension.dart';
import 'package:tiga_belas_apps/core/res/colours.dart';

class UserInfoWidget extends StatelessWidget implements PreferredSizeWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.backgroundUserBlue,
      child: Column(
        children: [
          SizedBox(
            height: context.height * .05,
          ),
          Padding(
            padding: EdgeInsets.all(context.width * .05),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: context.width * .03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ken Ramandha",
                      style: TextStyle(
                        fontSize: context.textTitleSmall,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "kenramandha@gmail.com",
                      style: TextStyle(
                        fontSize: context.textDescriptionMedium,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 75);
}
