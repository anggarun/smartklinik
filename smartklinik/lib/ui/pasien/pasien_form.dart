import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void dispose() {
    _noRmCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _telpCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Pasien')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldInput("No. RM", _noRmCtrl),
              SizedBox(height: 16),
              _fieldInput("Nama Pasien", _namaCtrl),
              SizedBox(height: 16),
              _fieldTanggalLahir(),
              SizedBox(height: 16),
              _fieldInput("Nomor Telepon", _telpCtrl),
              SizedBox(height: 16),
              _fieldInput("Alamat", _alamatCtrl),
              SizedBox(height: 24),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldInput(String label, TextEditingController ctrl) {
    return TextField(
      controller: ctrl,
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _fieldTanggalLahir() {
    return TextField(
      controller: _tanggalLahirCtrl,
      readOnly: true,
      decoration: InputDecoration(
        labelText: "Tanggal Lahir",
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          setState(() {
            _tanggalLahirCtrl.text =
                "${picked.day}/${picked.month}/${picked.year}";
          });
        }
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pasien pasien = Pasien(
          nomor_rm: _noRmCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telepon: _telpCtrl.text,
          alamat: _alamatCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien)),
        );
      },
      child: Text("Simpan"),
    );
  }
}
