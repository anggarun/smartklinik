import 'package:flutter/material.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});
  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
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
      appBar: AppBar(title: Text('Tambah Pegawai')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16), // biar lebih rapi
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: "NIP")),
              SizedBox(height: 20),
              TextField(decoration: InputDecoration(labelText: "Nama Pegawai")),
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
                    firstDate: DateTime(2000),
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
              TextField(decoration: InputDecoration(labelText: "Email")),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // validasi atau simpan data bisa ditambahkan di sini
                    print("Form disimpan");
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
