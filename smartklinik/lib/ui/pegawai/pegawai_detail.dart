import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetail({
    super.key,
    required this.pegawai,
    required Pegawai Pegawai,
  });

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("Nip : ${widget.pegawai.nip} ", style: TextStyle(fontSize: 20)),
          Text(
            "Nama Pegawai : ${widget.pegawai.nama} ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Tanggal Lahir : ${widget.pegawai.tanggal_lahir} ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Nomor Telepon : ${widget.pegawai.nomor_telepon} ",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            "Email : ${widget.pegawai.email} ",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Ubah'),
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Hapus'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
