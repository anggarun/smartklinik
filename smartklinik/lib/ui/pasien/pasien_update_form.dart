import 'package:flutter/material.dart';
import '../../model/pasien.dart';
import 'pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _telpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _noRmCtrl.text = widget.pasien.nomor_rm;
    _namaCtrl.text = widget.pasien.nama;
    _tglLahirCtrl.text = widget.pasien.tanggal_lahir;
    _telpCtrl.text = widget.pasien.nomor_telepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ubah Pasien')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _field("No. RM", _noRmCtrl),
              _field("Nama Pasien", _namaCtrl),
              _fieldTanggalLahir(),
              _field("Nomor Telepon", _telpCtrl),
              _field("Alamat", _alamatCtrl),
              SizedBox(height: 24),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  Widget _fieldTanggalLahir() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
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
        Pasien pasien = Pasien(
          nomor_rm: _noRmCtrl.text,
          nama: _namaCtrl.text,
          tanggal_lahir: _tglLahirCtrl.text,
          nomor_telepon: _telpCtrl.text,
          alamat: _alamatCtrl.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien)),
        );
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
