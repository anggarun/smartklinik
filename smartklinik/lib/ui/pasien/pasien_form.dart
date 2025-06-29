import 'package:flutter/material.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});
  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tanggalLahirController = TextEditingController();

  @override
  void dispose() {
    _tanggalLahirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Pasien')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16), // agar tampilan lebih rapi
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: "No. RM")),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: "Nama Pasien")),
              SizedBox(height: 20),
              TextField(
                controller: _tanggalLahirController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Tanggal Lahir",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    String formattedDate =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    setState(() {
                      _tanggalLahirController.text = formattedDate;
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: "Nomor Telepon"),
              ),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: "Alamat")),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print("Data pasien disimpan");
                  },
                  child: Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
