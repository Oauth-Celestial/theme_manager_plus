// ignore_for_file: must_be_immutable

part of 'theme_manager_plus.dart';

class CustomTheme<T> extends InheritedWidget {
  const CustomTheme(
      {Key? key,
      required Widget child,
      required this.currentTheme,
      required this.changeCurrentTheme,
      this.isDarkMode = false})
      : super(key: key, child: child);

  // ignore: overridden_fields
  // Child which needs to be changed
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
  T currentTheme;

  /// Light theme data
  T lightTheme;

  /// dark theme data
  T darkTheme;
  bool isDarkMode;

  ThemeManagerPlus(
      {Key? key,
      required this.child,
      required this.currentTheme,
      required this.lightTheme,
      this.isDarkMode = false,
      required this.darkTheme})
      : super(key: key);

  @Deprecated('context.themeOf<T>() instead')
  static CustomTheme<T> of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomTheme<T>>()!;
  }

  @override
  ThemeManagerPlusState<T> createState() => ThemeManagerPlusState<T>();
}

class ThemeManagerPlusState<T> extends State<ThemeManagerPlus<T>> {
  late T currentTheme;
  late T lightTheme;
  late T darkTheme;

  @override
  void initState() {
    currentTheme = widget.currentTheme;
    lightTheme = widget.lightTheme;
    darkTheme = widget.darkTheme;
    widget.isDarkMode = widget.currentTheme == widget.darkTheme;

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
      child: Builder(builder: (context) {
        return widget.child;
      }),
    );
  }
}

extension ThemeExtension on BuildContext {
  T? themeOf<T>() {
    // return ThemeManagerPlus.of<T>(this).currentTheme;
    return dependOnInheritedWidgetOfExactType<CustomTheme<T>>()?.currentTheme;
  }

  bool isDarkMode<T>() {
    final data = dependOnInheritedWidgetOfExactType<CustomTheme<T>>();
    if (data == null) {
      return false;
    }

    return data.isDarkMode;
  }

  changeCurrentTheme<T>() {
    final data = dependOnInheritedWidgetOfExactType<CustomTheme<T>>();
    print(data);
    dependOnInheritedWidgetOfExactType<CustomTheme<T>>()?.changeCurrentTheme();
  }
}
