import 'package:flutter/material.dart';
import '../../model/pegawai.dart';
import 'pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nipCtrl.text = widget.pegawai.nip;
    _namaCtrl.text = widget.pegawai.nama;
    _tglLahirCtrl.text = widget.pegawai.tanggal_lahir;
    _telpCtrl.text = widget.pegawai.nomor_telepon;
    _emailCtrl.text = widget.pegawai.email;
    _passwordCtrl.text = widget.pegawai.password;
  }

  @override
  void dispose() {
    _nipCtrl.dispose();
    _namaCtrl.dispose();
    _tglLahirCtrl.dispose();
    _telpCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ubah Pegawai')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldInput("NIP", _nipCtrl),
              _fieldInput("Nama Pegawai", _namaCtrl),
              _fieldTanggalLahir(),
              _fieldInput("Nomor Telepon", _telpCtrl),
              _fieldInput("Email", _emailCtrl),
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
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: ctrl,
        obscureText: isPassword,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _fieldTanggalLahir() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: _tglLahirCtrl,
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
              _tglLahirCtrl.text =
                  "${picked.day}/${picked.month}/${picked.year}";
            });
          }
        },
      ),
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pegawai pegawai = Pegawai(
          nip: _nipCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tglLahirCtrl.text,
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
      child: const Text("Simpan Perubahan"),
    );
  }
}
