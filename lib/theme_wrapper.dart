import 'package:flutter/material.dart';

class CustomTheme<T> extends InheritedWidget {
  CustomTheme(
      {Key? key,
      required this.child,
      required this.currentTheme,
      required this.changeCurrentTheme,
      this.isDarkMode = false})
      : super(key: key, child: child);
  @override
  final Widget child; // Child which needs to be changed
  // Holds to the App State
  final T
      currentTheme; // passed as generic so we can use it with other type in future
  final bool isDarkMode;

  /// Handle the change of theme
  final void Function() changeCurrentTheme;

  @override
  bool updateShouldNotify(CustomTheme<T> oldWidget) {
    return oldWidget.currentTheme != currentTheme;
  }
}

/// A stateful wrappper for theme manager
class ThemeManagerPlus<T> extends StatefulWidget {
  final Widget child;

  /// The current  theme of the app
  final T currentTheme;

  /// Light theme data
  T? lightTheme;

  /// dark theme data
  T? darkTheme;
  bool isDarkMode;

  ThemeManagerPlus(
      {Key? key,
      required this.child,
      required this.currentTheme,
      this.lightTheme,
      this.isDarkMode = false,
      this.darkTheme})
      : super(key: key);

  /// Access the current inject state
  static CustomTheme<T> of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomTheme<T>>()!;
  }

  @override
  ThemeManagerPlusState<T> createState() => ThemeManagerPlusState<T>();
}

class ThemeManagerPlusState<T> extends State<ThemeManagerPlus<T>> {
  T? currentTheme;
  T? lightTheme;
  T? darkTheme;

  @override
  void initState() {
    currentTheme = widget.currentTheme;
    lightTheme = widget.lightTheme;
    darkTheme = widget.darkTheme;

    super.initState();
  }

  /// Responsible to change the theme
  void changeTheme() {
    if (currentTheme == lightTheme) {
      setState(() {
        widget.isDarkMode = true;
        currentTheme = darkTheme;
      });
    } else if (currentTheme == darkTheme) {
      setState(() {
        currentTheme = lightTheme;
        widget.isDarkMode = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return CustomTheme<T>(
      changeCurrentTheme: changeTheme,
      currentTheme: currentTheme!,
      isDarkMode: widget.isDarkMode,
      child: widget.child,
    );
  }
}
