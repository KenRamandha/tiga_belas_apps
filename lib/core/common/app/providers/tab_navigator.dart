import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TabNavigator extends ChangeNotifier {
  TabNavigator(this._initialPage) {
    _navigationStack.add(_initialPage);
  }

  final TabItem _initialPage;

  final List<TabItem> _navigationStack = [];

  TabItem get currentPage => _navigationStack.last;

  void push(TabItem page) {
    _navigationStack.add(page);
    notifyListeners();
  }

  void pop() {
    if (_navigationStack.length > 1) {
      _navigationStack.removeLast();
      notifyListeners();
    }
  }

  void popToRoot() {
    _navigationStack
      ..clear()
      ..add(_initialPage);
    notifyListeners();
  }

  void popTo(TabItem page) {
    if (_navigationStack.contains(page)) {
      _navigationStack.removeRange(
          _navigationStack.indexOf(page) + 1, _navigationStack.length);
      notifyListeners();
    }
  }

  void popUntil(TabItem? page) {
    if (page == null) {
      popToRoot();
      return;
    }

    if (_navigationStack.contains(page) && _navigationStack.length > 1) {
      _navigationStack.removeRange(
          _navigationStack.indexOf(page) + 1, _navigationStack.length);
      notifyListeners();
    }
  }

  void pushAndRemoveUntil(TabItem page) {
    _navigationStack
      ..clear()
      ..add(page);
    notifyListeners();
  }
}

class TabNavigatorProvider extends InheritedNotifier<TabNavigator> {
  const TabNavigatorProvider({
    required this.navigator,
    required super.child,
    super.key,
  }) : super(notifier: navigator);

  final TabNavigator navigator;

  static TabNavigator? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TabNavigatorProvider>()
        ?.navigator;
  }
}

class TabItem extends Equatable {
  const TabItem({required this.child});

  final Widget child;

  @override
  List<dynamic> get props => [child];
}
