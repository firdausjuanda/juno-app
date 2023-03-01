import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motowash/app/data/override.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await dotenv.load(fileName: ".env");
  final MaterialColor mycolor = MaterialColor(
    const Color.fromARGB(255, 201, 197, 1).value,
    const <int, Color>{
      50: Color.fromARGB(255, 201, 197, 1),
      100: Color.fromARGB(255, 201, 197, 1),
      200: Color.fromARGB(235, 201, 197, 1),
      300: Color.fromARGB(215, 201, 197, 1),
      400: Color.fromARGB(195, 201, 197, 1),
      500: Color.fromARGB(175, 201, 197, 1),
      600: Color.fromARGB(155, 201, 197, 1),
      700: Color.fromARGB(135, 201, 197, 1),
      800: Color.fromARGB(115, 201, 197, 1),
      900: Color.fromARGB(95, 201, 197, 1),
    },
  );
  runApp(
    GetMaterialApp(
      title: "Juno Wash",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        secondaryHeaderColor: mycolor.shade900,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: mycolor,
          onPrimary: Colors.black,
          secondary: Colors.white,
          onSecondary: Colors.blueGrey,
          error: Colors.red,
          onError: Colors.white,
          background: Colors.blueGrey,
          onBackground: Colors.white,
          surface: Colors.blueGrey,
          onSurface: Colors.white,
        ),
        canvasColor: Colors.blueGrey[900],
        cardColor: Colors.blueGrey[900],
        dialogTheme: DialogTheme(
          backgroundColor: Colors.blueGrey[900],
        ),
        primarySwatch: mycolor,
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.grey),
          labelMedium: TextStyle(color: Colors.grey),
          labelSmall: TextStyle(color: Colors.grey),
        ),
        scaffoldBackgroundColor: Colors.blueGrey[900],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.blueGrey[900],
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedItemColor: Colors.white,
        ),
        primaryIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
    ),
  );
}
