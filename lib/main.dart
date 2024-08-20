import 'package:flutter/material.dart';
import 'package:mobile_starter/feature/presentation/screens/service/service_test_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: ServiceTestScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}