
import 'package:flutter/material.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang AgriClima'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'AgriClima LSTM adalah aplikasi untuk '
          'membantu memantau dan memprediksi kondisi '
          'mikroklimat tanaman, meliputi suhu udara, '
          'kelembapan udara, dan kelembapan tanah.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
