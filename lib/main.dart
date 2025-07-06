import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example_gaurav/container_provider.dart';
import 'package:provider_example_gaurav/home_page.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ContainerProvider(containerHeight: 100.0)
          )
        ],
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

