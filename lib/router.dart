//here is the route
import 'package:flutter/material.dart';
import 'package:teste_riverpod/main.dart';
import 'package:teste_riverpod/model.dart';

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