import 'package:flutter_application_4/cubit/create_users/create_user_cubit.dart';
import 'package:flutter_application_4/screen/auth/auth_screen.dart';
import 'package:flutter_application_4/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flubter/screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateUserCubit>(
          create: (_) => CreateUserCubit(AuthRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'punggungku sakit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: const AuthScreen(),
      ),
    );
  }
}