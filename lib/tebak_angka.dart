import 'dart:io';
import 'dart:math';

class GameTebakAngka {
  final int _angkaBenar; // angka acak yang harus ditebak
  int _percobaan = 0; // jumlah percobaan
  bool _menang = false; // status kemenangan
  final int _batasPercobaan = 5; // batas maksimal percobaan

  // Konstruktor: menghasilkan angka acak antara 1–10
  GameTebakAngka() : _angkaBenar = Random().nextInt(10) + 1;

  // Fungsi utama untuk memulai permainan
  void mulai() {
    print('Saya sudah memilih angka antara 1 - 10. Coba tebak!');

    while (!_menang) {
      stdout.write('Masukkan tebakan Anda: ');
      String? input = stdin.readLineSync();

      // Validasi input
      if (input == null || input.isEmpty) {
        print('Input tidak boleh kosong!');
        continue;
      }

      int? tebakan = int.tryParse(input);
      if (tebakan == null) {
        print('Masukkan angka yang valid!');
        continue;
      }

      _percobaan++;
      _cekTebakan(tebakan);

      // Hentikan permainan jika sudah melebihi batas percobaan
      if (_percobaan == _batasPercobaan && !_menang) {
        print('Kesempatan habis . Angka yang benar adalah $_angkaBenar.');
        break;
      }
    }

    print('Terima kasih sudah bermain!');
  }

  // Fungsi internal untuk memeriksa hasil tebakan
  void _cekTebakan(int tebakan) {
    if (tebakan == _angkaBenar) {
      print('Selamat! Anda menebak dengan benar dalam $_percobaan percobaan ');
      _menang = true;
    } else if (tebakan < _angkaBenar) {
      print('Terlalu kecil! Coba lagi.');
    } else {
      print('Terlalu besar! Coba lagi.');
    }
  }

  // Getter & helper tambahan untuk pengujian (test)
  bool cekTebakanBenar(int tebakan) => tebakan == _angkaBenar;
  int get angkaBenar => _angkaBenar;
  int get percobaan => _percobaan;
}
