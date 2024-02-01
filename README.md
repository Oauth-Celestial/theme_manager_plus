# theme_manager_plus

Say goodbye to the hassle of remembering complex color schemes! With Theme Manager Plus, managing themes is a breeze. Simply create a class for light and dark themes, tweak your desired colors and styles, and enjoy a seamless and modern app experience. No more headaches, just easy and efficient theme management!


![simulator-screen-recording-iphone-15-pro-2024-01-31-at-214253_5zDSZU03-ezgif com-video-to-gif-converter](https://github.com/Oauth-Celestial/theme_manager_plus/assets/119127289/e471eb1c-69de-4aff-9344-78fcee6e8df8)



## Getting started
First, add theme_manager_plus as a dependency in your pubspec.yaml file

```dart
theme_manager_plus: ^0.0.2
```


 Create Your own class which defines colors and styles which you have to inject e.g

```dart
class AppTheme {
  Color? backgroundColor;
  TextStyle? heading;
  TextStyle? subheading;

  AppTheme({this.backgroundColor, this.heading, this.subheading});
}
```

Wrap your material app with the ThemeMangerWrapper and assign your light and dark theme and set the current theme to initial theme you want

```dart
home:ThemeManagerPlus<AppTheme>(
          currentTheme: lightTheme,
          darkTheme: Darktheme,
          lightTheme: lightTheme,
          child: MyApp()),
    );
```

Access data from theme 

```dart
 ThemeManagerPlus.of<AppTheme>(context).currentTheme.backgroundColor,
```

**Note:** Replace your class name with the custom class name 


**Change current theme with theme manager plus**

```dart
ThemeManagerPlus.of<AppTheme>(context).changeCurrentTheme();
```

**Check current theme is dark theme**

```dart
ThemeManagerPlus.of<AppTheme>(context).isDarkMode
```


## Contribution 🤝

Feel free to contribute and open pull requests. 🙌


## Issues and Feedback 🐛

Feel free to post a feature requests or report a bug [here](https://github.com/Oauth-Celestial/theme_manager_plus/issues).



