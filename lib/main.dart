// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: MyRouter.generaretRoute,
      initialRoute: "home",
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(
            child: Text("ola mundo"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "homeSecond",
                arguments: UserModel(name: "Fatima Ezzahra El", id: 1),
              );
            },
            child: const Text("Routing"),
          )
        ],
      ),
    );
  }
}
//my second route

// ignore: must_be_immutable
class SecondHome extends ConsumerWidget {
  SecondHome({super.key, required this.user});
  UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(user.name);
  }
}

//here is the route
class MyRouter {
  static Route<dynamic> generaretRoute(RouteSettings settings) {
    switch (settings.name) {
      case "home":
        return MaterialPageRoute(builder: (context) => Home());
      case "homeSecond":
        return MaterialPageRoute(
          builder: (context) {
            UserModel user = settings.arguments as UserModel;
            return SecondHome(
              user: user,
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Text("no route found"),
          ),
        );
    }
  }
}

class UserModel {
  String name;
  int id;
  UserModel({
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as int,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, id: $id)';
}
