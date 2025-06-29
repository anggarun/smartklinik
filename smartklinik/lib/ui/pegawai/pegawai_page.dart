import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_detail.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});
  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Data Pegawai")),
      body: ListView(
        children: [
          GestureDetector(
            child: Card(child: ListTile(title: const Text("Nova"))),
            onTap: () {
              Pegawai pegawai = Pegawai(
                id: '1',
                nip: '01',
                nama: "Nova",
                tanggal_lahir: '25/08/1999',
                nomor_telepon: '0897555566644',
                email: 'Nova@gmail.com',
                password: 'nova123',
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PegawaiDetail(pegawai: pegawai, Pegawai: pegawai),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
