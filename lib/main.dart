import 'package:flutter/material.dart';
import 'package:flutter_application_4/screen/home_screen.dart';
import 'package:flutter_application_4/service/api_service.dart';

void main() async {
  final api = ApiService();

  final users = api.getUsers();

  print(users);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}
