import 'package:flutter/material.dart';
import 'halamanberanda.dart';
import 'halaman_statistik.dart';
import 'halaman_pengaturan.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class HalamanPrediksiTab extends StatelessWidget {
  const HalamanPrediksiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.eco),
        label: const Text('Buka Form Prediksi'),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.inputPrediksi,
          );
        },
      ),
    );
  }
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int indeksTerpilih = 0;

  final List<String> namaTab = [
    'Beranda',
    'Prediksi',
    'Statistik',
    'Pengaturan',
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
  const HalamanBeranda(),
  const HalamanPrediksiTab(),
  const HalamanStatistik(),
  const HalamanPengaturan(),
];

    return Scaffold(
      appBar: AppBar(
        title: Text('AgriClima - ${namaTab[indeksTerpilih]}'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: IndexedStack(
        index: indeksTerpilih,
        children: halaman,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: indeksTerpilih,
        onDestinationSelected: (index) {
          setState(() {
            indeksTerpilih = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.eco_outlined),
            selectedIcon: Icon(Icons.eco),
            label: 'Prediksi',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Statistik',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}
