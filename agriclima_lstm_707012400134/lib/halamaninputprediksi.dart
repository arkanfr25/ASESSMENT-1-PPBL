
import 'package:flutter/material.dart';

class HalamanInputPrediksi extends StatefulWidget {
  const HalamanInputPrediksi({super.key});

  @override
  State<HalamanInputPrediksi> createState() =>
      _HalamanInputPrediksiState();
}

class _HalamanInputPrediksiState extends State<HalamanInputPrediksi> {
  final _formKey = GlobalKey<FormState>();

  final suhuController = TextEditingController();
  final udaraController = TextEditingController();
  final tanahController = TextEditingController();
  final petugasController = TextEditingController();

  String tanaman = 'Padi';
  bool dataBenar = false;

  @override
  void dispose() {
    suhuController.dispose();
    udaraController.dispose();
    tanahController.dispose();
    petugasController.dispose();
    super.dispose();
  }

  String? cekAngka(String? value) {
    if (value == null || value.isEmpty) {
      return 'Data harus diisi';
    }

    if (double.tryParse(value) == null) {
      return 'Masukkan angka';
    }

    return null;
  }

  String? cekKelembapan(String? value) {
    final error = cekAngka(value);

    if (error != null) {
      return error;
    }

    final angka = double.parse(value!);

    if (angka < 0 || angka > 100) {
      return 'Isi angka 0 sampai 100';
    }

    return null;
  }

  String? cekPetugas(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama petugas harus diisi';
    }

    return null;
  }

  void simpanData() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!dataBenar) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Centang Data sudah benar terlebih dahulu'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah data ingin disimpan?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(this.context).showSnackBar(
                const SnackBar(
                  content: Text('Data tersimpan'),
                ),
              );

              Navigator.pop(this.context);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  Widget inputAngka(
    String judul,
    TextEditingController controller,
    String? Function(String?) validator,
  ) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: true,
      ),
      decoration: InputDecoration(
        labelText: judul,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Prediksi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text('Form Prediksi Mikroklimat'),

              const SizedBox(height: 16),

              RadioGroup<String>(
                groupValue: tanaman,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      tanaman = value;
                    });
                  }
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      value: 'Padi',
                      title: Text('Padi'),
                    ),
                    RadioListTile<String>(
                      value: 'Jagung',
                      title: Text('Jagung'),
                    ),
                    RadioListTile<String>(
                      value: 'Cabai',
                      title: Text('Cabai'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              inputAngka(
                'Prediksi Suhu Udara (°C)',
                suhuController,
                cekAngka,
              ),

              const SizedBox(height: 12),

              inputAngka(
                'Prediksi Kelembapan Udara (%)',
                udaraController,
                cekKelembapan,
              ),

              const SizedBox(height: 12),

              inputAngka(
                'Prediksi Kelembapan Tanah (%)',
                tanahController,
                cekKelembapan,
              ),

              const SizedBox(height: 12),

              TextFormField(
                controller: petugasController,
                decoration: const InputDecoration(
                  labelText: 'Nama Petugas',
                  border: OutlineInputBorder(),
                ),
                validator: cekPetugas,
              ),

              const SizedBox(height: 12),

              CheckboxListTile(
                value: dataBenar,
                title: const Text('Data sudah benar'),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    dataBenar = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 12),

              ElevatedButton(
                onPressed: simpanData,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
