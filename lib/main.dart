import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lostandfound/models.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int activetab = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getbody(),
      bottomNavigationBar: getbottombar(),
    );
  }

  Widget getbody() {
    return IndexedStack(index: activetab, children: pages);
  }

  Widget getbottombar() {
    return BottomNavigationBar(
      backgroundColor: Color.fromRGBO(52, 58, 64, 1),
      currentIndex: activetab,
      onTap: (value) {
        setState(() {
          activetab = value;
        });
      },
      // fixedColor: Colors.white,
      selectedItemColor: Colors.white,
      iconSize: 35,
      unselectedItemColor: Colors.white,

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.feed),
          label: 'Feed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
