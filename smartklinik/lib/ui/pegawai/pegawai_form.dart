import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggalLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    _nipCtrl.dispose();
    _namaCtrl.dispose();
    _tanggalLahirCtrl.dispose();
    _telpCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Pegawai')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldInput("NIP", _nipCtrl),
              SizedBox(height: 16),
              _fieldInput("Nama Pegawai", _namaCtrl),
              SizedBox(height: 16),
              _fieldTanggalLahir(),
              SizedBox(height: 16),
              _fieldInput("Nomor Telepon", _telpCtrl),
              SizedBox(height: 16),
              _fieldInput("Email", _emailCtrl),
              SizedBox(height: 16),
              _fieldInput("Password", _passwordCtrl, isPassword: true),
              SizedBox(height: 24),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldInput(
    String label,
    TextEditingController ctrl, {
    bool isPassword = false,
  }) {
    return TextField(
      controller: ctrl,
      obscureText: isPassword,
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
        Pegawai pegawai = Pegawai(
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tanggalLahirCtrl.text,
          nomor_telepon: _telpCtrl.text,
          email: _emailCtrl.text,
          password: _passwordCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PegawaiDetail(pegawai: pegawai),
          ),
        );
      },
      child: Text("Simpan"),
    );
  }
}
