```dart

import 'package:example/app_theme_color.dart';
import 'package:example/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager_plus/theme_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class AppTheme {
  Color? backgroundColor;
  TextStyle? heading;
  TextStyle? subheading;

  AppTheme({this.backgroundColor, this.heading, this.subheading});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  AppTheme lightTheme = AppTheme(
  backgroundColor: Colors.white,
  heading: TextStyle(color: Colors.black, fontSize: 16),
  subheading: TextStyle(color: Colors.black, fontSize: 14),
);

AppTheme Darktheme = AppTheme(
  backgroundColor: Colors.black,
  heading: TextStyle(color: Colors.white, fontSize: 16),
  subheading: TextStyle(color: Colors.white, fontSize: 14),
);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ThemeManagerPlus<AppTheme>(
          currentTheme: lightTheme,
          darkTheme: Darktheme,
          lightTheme: lightTheme,
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool switchValue = false;

  void _incrementCounter() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor:
          ThemeManagerPlus.of<AppTheme>(context).currentTheme.backgroundColor,
      appBar: AppBar(
      
        backgroundColor:
            ThemeManagerPlus.of<AppTheme>(context).currentTheme.backgroundColor,
  
        title: Text(
          widget.title,
          style: ThemeManagerPlus.of<AppTheme>(context).currentTheme.heading,
        ),
      ),
      body: Center(
     
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: ThemeManagerPlus.of<AppTheme>(context).isDarkMode,
              onChanged: (value) {
                ThemeManagerPlus.of<AppTheme>(context).changeCurrentTheme();
              },
              activeColor:
                  Colors.blue, // Change the color when the switch is ON
            ),
            Text(
              'You have pushed the button this many times:',
              style:
                  ThemeManagerPlus.of<AppTheme>(context).currentTheme.heading,
            ),
            Text(
              '$_counter',
              style:
                  ThemeManagerPlus.of<AppTheme>(context).currentTheme.heading,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 

    );
  }
}

```