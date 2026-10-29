
import 'package:flutter/material.dart';
import 'pages/app_routes.dart';

void main() {
  runApp(const AgriClimaApp());
}

class AgriClimaApp extends StatelessWidget {
  const AgriClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriClima',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.beranda,
      routes: AppRoutes.routes,
    );
  }
}
