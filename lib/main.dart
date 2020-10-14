import 'package:flutter/material.dart';
import 'package:nutrilife/screens/hoy_screen.dart';
import 'package:nutrilife/screens/login_screen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Hero Navigation',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         canvasColor: Colors.blue.shade100,
//       ),
//       home: HoyScreen(),
//     );
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(104, 51, 157, .5),
    500: Color.fromRGBO(104, 51, 157, .6),
    600: Color.fromRGBO(104, 51, 157, .7),
    700: Color.fromRGBO(104, 51, 157, .8),
    800: Color.fromRGBO(104, 51, 157, .9),
    900: Color.fromRGBO(104, 51, 157, 1),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(0xFF68339D, color),
        canvasColor: MaterialColor(0xFF68339D, color),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              bottom: TabBar(
                tabs: [
                  Tab(text: "Hoy"),
                  Tab(text: "Salud"),
                  Tab(text: "Natural"),
                ],
              ),
              title: Image.asset(
                "assets/ALCOBI.jpg",
                fit: BoxFit.cover,
                height: 50,
              ),
              centerTitle: true,
            ),
            body: TabBarView(
              children: [
                HoyScreen(),
                Icon(Icons.favorite),
                Icon(Icons.nature),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Icon(Icons.input),
              backgroundColor: Colors.orange,
            )));
  }
}
