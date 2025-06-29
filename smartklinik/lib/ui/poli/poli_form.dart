import 'package:flutter/material.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});
  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah poli')),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: "Nama Poli")),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text("Simpan")),
            ],
          ),
        ),
      ),
    );
  }
}
