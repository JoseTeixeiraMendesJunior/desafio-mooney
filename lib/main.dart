import 'package:desafio_mooney/controllers/registerController.dart';
import 'package:desafio_mooney/layouts/global_color.dart';
import 'package:desafio_mooney/pages/register/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RegisterController registerController = Get.put(RegisterController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio Mooney',

      theme: ThemeData(
          fontFamily: 'Roboto',
          visualDensity: VisualDensity.adaptivePlatformDensity,

          /// Global Custom Elevated Button;
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            primary: GlobalColor.active,
            textStyle: const TextStyle(fontSize: 20),
          )),
          textTheme:
              const TextTheme(bodyText2: TextStyle(color: Colors.white))),

      /// HomePage;
      home: const ProfilePage(),
    );
  }
}
