// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teste_riverpod/model.dart';
import 'package:teste_riverpod/router.dart';

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



