import 'package:consuming_rest_api/core/injections/injections.dart';
import 'package:consuming_rest_api/core/route/route_generator.dart';
import 'package:consuming_rest_api/core/view/airlines_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const EntryPoint());
}

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consuming Rest API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AirlinePage.routeName,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
