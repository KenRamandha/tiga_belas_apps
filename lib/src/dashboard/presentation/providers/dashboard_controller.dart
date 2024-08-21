import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiga_belas_apps/core/common/app/providers/tab_navigator.dart';
import 'package:tiga_belas_apps/core/common/views/presistent_view.dart';
import 'package:tiga_belas_apps/core/services/injection_container.dart';
import 'package:tiga_belas_apps/src/course/presentation/views/course_view.dart';
import 'package:tiga_belas_apps/src/home/presentation/views/home_view.dart';
import 'package:tiga_belas_apps/src/profile/presentation/views/profile_view.dart';
import 'package:tiga_belas_apps/src/webinar/presentation/views/webinar_view.dart';

class DashboardController extends ChangeNotifier {
  List<int> _indexHistory = [0];
  late SharedPreferences prefs;
  late List<Widget> _screens;

  DashboardController() {
    _initializePrefs();
  }

  Future<void> _initializePrefs() async {
    prefs = sl<SharedPreferences>();
    _screens = _buildScreens();
    notifyListeners();
  }

  List<Widget> _buildScreens() {
    return [
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          const TabItem(
            child: HomeView(),
          ),
        ),
        child: const PersistentView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          const TabItem(
            child: WebinarView(),
          ),
        ),
        child: const PersistentView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          const TabItem(
            child: CourseView(),
          ),
        ),
        child: const PersistentView(),
      ),
      ChangeNotifierProvider(
        create: (_) => TabNavigator(
          const TabItem(
            child: ProfileView(),
          ),
        ),
        child: const PersistentView(),
      ),
    ];
  }

  List<Widget> get screens => _screens;
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }

  void reinitialize() async {
    _indexHistory = [0];
    _currentIndex = 0;
    prefs = sl<SharedPreferences>();
    _screens = _buildScreens();
    notifyListeners();
  }
}
