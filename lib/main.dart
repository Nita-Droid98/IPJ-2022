import 'package:flutter/material.dart';
import 'package:flutter_ipj_project/init.dart';
import 'package:flutter_ipj_project/route_manager.dart';

void main() {
  InitApp.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Attendance App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteManager.welcomePageScreen,
      onGenerateRoute: RouteManager.onGenerateRoute,
    );
  }
}
