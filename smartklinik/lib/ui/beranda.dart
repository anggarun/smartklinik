import 'package:flutter/material.dart';
import 'package:smartklinik/widgets/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(title: Text("Beranda")),
      body: Center(child: Text('Selamat Datang')),
    );
  }
}
