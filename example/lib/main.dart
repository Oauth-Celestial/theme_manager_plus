import 'package:example/app_theme_color.dart';
import 'package:example/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:theme_manager_plus/theme_manager_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          currentTheme: Darktheme,
          darkTheme: Darktheme,
          lightTheme: lightTheme,
          child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool switchValue = false;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // if (ThemeManagerPlus.of<AppTheme>(context)
      //         .theme
      //         .themeSettingfor
      //         ?.toLowerCase() ==
      //     "Kintree Light".toLowerCase()) {
      //   ThemeManagerPlus.of<AppTheme>(context).onThemeChange!(Darktheme);
      // } else {
      //   ThemeManagerPlus.of<AppTheme>(context).onThemeChange!(lightTheme);
      // }
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: context.themeOf<AppTheme>()?.backgroundColor,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: context.themeOf<AppTheme>()?.backgroundColor,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: context.themeOf<AppTheme>()?.heading,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: context.isDarkMode<AppTheme>(),
              onChanged: (value) {
                context.changeCurrentTheme<AppTheme>();
              },
              activeColor:
                  Colors.blue, // Change the color when the switch is ON
            ),
            Text(
              'You have pushed the button this many times:',
              style: context.themeOf<AppTheme>()?.heading,
            ),
            Text(
              '$_counter',
              style: context.themeOf<AppTheme>()?.heading,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => SeconScreen(
                        myName: "Testing Navigation",
                      )));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SeconScreen extends StatelessWidget {
  String myName;
  SeconScreen({required this.myName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text("${myName} ")),
      ),
    );
  }
}
