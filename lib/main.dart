import 'package:appsewamotor/screen/editscreen.dart';
import 'package:appsewamotor/screen/profilescreen.dart';
import 'package:appsewamotor/screen/splashscreen.dart';
import 'package:appsewamotor/screen/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 255, 234, 255),
        ),
      ),
      home: UpdateProfileScreen(),
    );
  }
}
