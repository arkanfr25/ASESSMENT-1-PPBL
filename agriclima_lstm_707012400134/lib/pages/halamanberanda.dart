
import 'package:flutter/material.dart';
import 'app_routes.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Selamat Datang di AgriClima LSTM',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),

        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.eco,
                  size: 45,
                  color: Colors.green,
                ),
                SizedBox(height: 12),
                Text(
                  'Model Prediksi LSTM',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text('Prediksi kondisi mikroklimat 24 jam ke depan.'),
                SizedBox(height: 12),
                Text('Parameter mikroklimat:'),
                Text('1. Suhu udara (°C)'),
                Text('2. Kelembapan udara (%)'),
                Text('3. Kelembapan tanah (%)'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.tentang,
            );
          },
          icon: const Icon(Icons.info_outline),
          label: const Text('Tentang Aplikasi'),
        ),
      ],
    );
  }
}
