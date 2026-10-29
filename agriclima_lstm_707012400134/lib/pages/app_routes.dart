    import 'package:flutter/material.dart';
import 'package:agriclima_lstm_707012400134/halamaninputprediksi.dart';
import 'kerangka_navigasi.dart';
import 'halaman_tentang.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String tentang = '/tentang';
  static const String inputPrediksi = '/input-prediksi';

  static Map<String, WidgetBuilder> get routes => {
        beranda: (context) => const KerangkaNavigasi(),
        tentang: (context) => const HalamanTentang(),
        inputPrediksi: (context) =>
            const HalamanInputPrediksi(),
      };
}
