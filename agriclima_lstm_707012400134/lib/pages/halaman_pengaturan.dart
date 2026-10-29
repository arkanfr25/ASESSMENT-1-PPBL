

import 'package:flutter/material.dart';

class HalamanPengaturan extends StatefulWidget {
  const HalamanPengaturan({super.key});

  @override
  State<HalamanPengaturan> createState() =>
      _HalamanPengaturanState();
}

class _HalamanPengaturanState
    extends State<HalamanPengaturan> {
  bool notifikasiAktif = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const ListTile(
          leading: Icon(Icons.settings),
          title: Text('Pengaturan Aplikasi'),
        ),
        SwitchListTile(
          title: const Text('Notifikasi'),
          subtitle: const Text(
            'Aktifkan atau nonaktifkan notifikasi',
          ),
          value: notifikasiAktif,
          onChanged: (value) {
            setState(() {
              notifikasiAktif = value;
            });
          },
        ),
        const ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('Versi Aplikasi'),
          subtitle: Text('AgriClima LSTM 1.0'),
        ),
      ],
    );
  }
}
