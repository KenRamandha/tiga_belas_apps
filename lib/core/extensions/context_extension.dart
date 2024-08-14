import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiga_belas_apps/core/common/app/providers/user_provider.dart';
import 'package:tiga_belas_apps/src/auth/domain/entities/user.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExtention on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;

  //Text Size
  double get textTitleLarge => size.width * .07;
  double get textTitleMedium => size.width * .06;
  double get textTitleSmall => size.width * .05;

  double get textDescriptionLarge => size.width * .04;
  double get textDescriptionMedium => size.width * .033;
  double get textDescriptionSmall => size.width * .022;

  UserProvider get userProvider => read<UserProvider>();
  LocalUser? get currentUser => userProvider.user;

  // void pop() => tabNavigator.pop();

  // void push(Widget page) => tabNavigator.push(TabItem(child: page));
}
