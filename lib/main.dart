import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pattern_getx_methods/pages/create_page.dart';
import 'package:pattern_getx_methods/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Methods',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      getPages: [
        GetPage(name: "/home_page", page: () => const HomePage()),
        GetPage(name: "/create_page", page: () => const CreatePage())
      ],
    );
  }
}
