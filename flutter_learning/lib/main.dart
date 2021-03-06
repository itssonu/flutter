import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/routes.dart';

// import 'todo/TodoHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: routes,
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MenuButton(
                    route: 'i_am_rich',
                    color: Colors.redAccent,
                    appName: 'I Am Rich',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'container_learn',
                    color: Colors.blueAccent,
                    appName: 'Container',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MenuButton(
                    route: 'xquiz',
                    color: Colors.indigo,
                    appName: 'X Quizz',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'chatHome',
                    color: Colors.lightBlue[700],
                    appName: 'Flash Chat',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'todo',
                    color: Colors.lightBlue[200],
                    appName: 'Todo',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MenuButton(
                    route: 'my_profile_card',
                    color: Colors.teal,
                    appName: 'Profile Card',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'dice',
                    color: Colors.cyan,
                    appName: 'Dice',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MenuButton(
                    route: 'bmi',
                    color: Colors.black,
                    appName: 'Bmi Calculator',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'crypto',
                    color: Colors.blue[300],
                    appName: 'Crypto Exchnager',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MenuButton(
                    route: 'desionball',
                    color: Colors.green,
                    appName: 'Dession Ball',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'xylophone',
                    color: Colors.brown,
                    appName: 'Xylophone',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MenuButton(
                    route: 'quiz',
                    color: Colors.lime[900],
                    appName: 'Quiz',
                  ),
                ),
                Expanded(
                  child: MenuButton(
                    route: 'weather',
                    color: Colors.amberAccent,
                    appName: 'Weather App',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final Color color;
  final String appName;
  final String route;

  const MenuButton({this.color, this.appName, this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          // height: 100.0,
          // width: 100.0,
          padding: EdgeInsets.all(10.0),
          // margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Center(
              child: Text(
            appName,
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
