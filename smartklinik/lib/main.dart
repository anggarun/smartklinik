import 'package:flutter/material.dart';
import 'package:smartklinik/ui/beranda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Smart Klinik",
      debugShowCheckedModeBanner: false,
      home: Beranda(),
    );
  }
}
