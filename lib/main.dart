import 'package:flutter/material.dart';
import 'package:tabbar/account.dart';
import 'package:tabbar/home.dart';
import 'package:tabbar/message.dart';
import 'package:tabbar/notification.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late TabController _tabController;
  int _currentPosition=0;

  final _pages = [
    Home(),
    Messages(),
    Notificaitons(),
    Account(),

  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Tab Bar Demo"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),
            Tab(
              icon: Icon(Icons.message),
              text: "Message",
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: "Notifications",
            ),
            Tab(
              icon: Icon(Icons.account_balance),
              text: "Account",
            ),

          ],
          onTap: (position){
            setState(() {
              _currentPosition = position;
              print(position);
            });
          },
        ),
      ),
      drawer: Drawer(),
      body: _pages[_currentPosition],
    );
  }
}
