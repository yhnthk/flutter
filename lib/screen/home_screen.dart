import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/models/user_model.dart';
import 'package:flutter_application_4/screen/switch_screen.dart';
import 'package:flutter_application_4/repository/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final api = ApiService();

    return Scaffold(
      appBar: AppBar(title: Text("data users")),
      body: FutureBuilder<List<UserModel>>(
        future: api.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text("error ${snapshot.error}"));
          } else {
            final users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  title: Text("${user.name} | ${user.username}"),
                  subtitle: Text(user.email),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right),
        onPressed: () {
          Navigator.of(
            context,
          ).push(CupertinoPageRoute(builder: (context) => SwitchScreen()));
        },
      ),
    );
  }
}
