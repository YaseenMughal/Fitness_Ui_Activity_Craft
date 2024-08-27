import 'package:calories_fitness_app/provider/activityCheck_provider.dart';
import 'package:calories_fitness_app/provider/bottom_navigation_povider.dart';
import 'package:calories_fitness_app/provider/checkBox_provider.dart';
import 'package:calories_fitness_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckBoxProvider()),
        ChangeNotifierProvider(create: (context) => ActivityCheckProvider()),
        ChangeNotifierProvider(create: (context) => BottomBarProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
