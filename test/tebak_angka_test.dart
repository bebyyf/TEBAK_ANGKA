import 'package:test/test.dart';
import 'package:tebak_angka/tebak_angka.dart';

void main() {
  test('Angka benar berada di antara 1 dan 10', () {
    final game = GameTebakAngka();
    expect(game.angkaBenar >= 1 && game.angkaBenar <= 10, isTrue);
  });

  test('Fungsi cekTebakanBenar mengembalikan true jika tebakan benar', () {
    final game = GameTebakAngka();
    final benar = game.angkaBenar;
    expect(game.cekTebakanBenar(benar), isTrue);
  });

  test('Fungsi cekTebakanBenar mengembalikan false jika tebakan salah', () {
    final game = GameTebakAngka();
    int salah = (game.angkaBenar % 10) + 1; // pastikan berbeda
    if (salah == game.angkaBenar) salah = (salah + 1) % 10 + 1;
    expect(game.cekTebakanBenar(salah), isFalse);
  });
}
