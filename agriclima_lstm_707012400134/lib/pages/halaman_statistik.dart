
import 'package:flutter/material.dart';

class HalamanStatistik extends StatelessWidget {
  const HalamanStatistik({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Statistik Mikroklimat',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.thermostat),
            title: Text('Suhu Udara'),
            subtitle: Text('Parameter dalam °C'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.water_drop),
            title: Text('Kelembapan Udara'),
            subtitle: Text('Parameter dalam %'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.grass),
            title: Text('Kelembapan Tanah'),
            subtitle: Text('Parameter dalam %'),
          ),
        ),
      ],
    );
  }
}
