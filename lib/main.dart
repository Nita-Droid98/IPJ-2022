import 'package:flutter/material.dart';
import 'package:ipj_project_2022/providers/assessment_provider.dart';
import 'package:ipj_project_2022/providers/user_provider.dart';
import 'package:ipj_project_2022/screens/welcome_screen.dart';
import 'package:ipj_project_2022/widgets/welcome_screen_card.dart';
import 'package:provider/provider.dart';
import "package:firebase_core/firebase_core.dart";

import 'route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // InitApp.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => AssessmentProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WelcomePageScreen(),
      ),
    );
  }
}
