import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:tiga_belas_apps/core/res/colours.dart';
import 'package:tiga_belas_apps/core/res/media_res.dart';
import 'package:tiga_belas_apps/src/dashboard/presentation/providers/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  static const routeName = '/dashboard';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (_, controller, __) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            backgroundColor: Colors.white,
            elevation: 8,
            onTap: controller.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex == 0
                      ? IconlyBold.home
                      : IconlyLight.home,
                  color: controller.currentIndex == 0
                      ? Colours.backgroundBlue
                      : Colors.grey,
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: controller.currentIndex == 1
                    ? ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colours.backgroundBlue,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          MediaRes.iconWebinar,
                          width: 25,
                          height: 25,
                        ),
                      )
                    : ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          MediaRes.iconWebinar,
                          width: 25,
                          height: 25,
                        ),
                      ),
                label: 'Webinar',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: controller.currentIndex == 2
                    ? ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colours.backgroundBlue,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          MediaRes.iconCourse,
                          width: 25,
                          height: 25,
                        ),
                      )
                    : ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.grey,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset(
                          MediaRes.iconCourse,
                          width: 25,
                          height: 25,
                        ),
                      ),
                label: 'Course',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  controller.currentIndex == 3
                      ? IconlyBold.profile
                      : IconlyLight.profile,
                  color: controller.currentIndex == 3
                      ? Colours.backgroundBlue
                      : Colors.grey,
                ),
                label: 'Profile',
                backgroundColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
