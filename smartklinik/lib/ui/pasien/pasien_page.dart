import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_detail.dart';
import 'package:smartklinik/ui/pasien/pasien_form.dart';
import 'package:smartklinik/widgets/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});
  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: Icon(Icons.add),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasienForm()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: Card(child: ListTile(title: const Text("Doddy"))),
            onTap: () {
              Pasien pasien = Pasien(
                id: '1',
                nomor_rm: '01',
                nama: "Doddy",
                tanggal_lahir: '25/08/1999',
                nomor_telepon: '0897555566644',
                alamat: 'Cimone',
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
